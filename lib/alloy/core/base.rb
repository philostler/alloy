module Alloy
  module Core
    module Base
      @@executors = {}

      at_exit do
        @@executors.each_value do |executor|
          executor.send :shutdown
        end
      end

      private
      def create_executor size
        executor = Java::java.util.concurrent.Executors.new_scheduled_thread_pool size

        executor.continue_existing_periodic_tasks_after_shutdown_policy = false
        executor.execute_existing_delayed_tasks_after_shutdown_policy = false

        executor
      end
      def create_job clazz
        job = clazz.new
        job.class.send :include, Alloy::Job::Able

        job
      end
      def get_executor queue
        @@executors[queue] = create_executor(get_size(queue).is) unless @@executors.has_key? queue

        @@executors[queue]
      end
      def get_queue clazz
        queue = clazz.instance_variable_get :@queue unless queue

        raise NameError, "job class does not define a queue attribute" unless queue

        queue
      end
    end
  end
end