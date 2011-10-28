module Alloy
  module Core
    module RunOnce
      @@executors = Hash.new

      at_exit do
        @@executors.each_value do |executor|
          executor.send :shutdown
        end
      end

      def run_once *arguments
        if arguments[0].is_a? Class
          job_clazz = arguments.shift
          queue = get_queue job_clazz
        else
          queue = arguments.shift
          job_clazz = arguments.shift
        end

        limit = limit queue
        executor = @@executors[queue]
        if executor.nil?
          executor = Java::java.util.concurrent.Executors.new_scheduled_thread_pool limit
          executor.continue_existing_periodic_tasks_after_shutdown_policy = false
          executor.execute_existing_delayed_tasks_after_shutdown_policy = false
          @@executors[queue] = executor
        end
        job = create_job_instance job_clazz
        executor.submit job
      end

      private
      def create_job_instance clazz
        instance = clazz.new
        instance.class.send :include, Alloy::Job::Capability

        instance
      end
      def get_queue clazz
        raise ArgumentError, "job does not have a queue attribute defined" unless clazz.instance_variable_defined? :@queue

        clazz.instance_variable_get :@queue
      end
    end
  end
end