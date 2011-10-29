require "active_support/basic_object"
require "active_support/duration"

module Alloy
  module Core
    module Common
      @@executors = Hash.new

      at_exit do
        @@executors.each_value do |executor|
          executor.send :shutdown
        end
      end

      private
      def create_executor limit
        executor = Java::java.util.concurrent.Executors.new_scheduled_thread_pool limit
        executor.continue_existing_periodic_tasks_after_shutdown_policy = false
        executor.execute_existing_delayed_tasks_after_shutdown_policy = false

        executor
      end
      def create_job clazz
        job = clazz.new
        job.class.send :include, Alloy::Job::Capability

        job
      end
      def get_executor queue
        @@executors[queue] = create_executor(get_limit queue) unless @@executors[queue]

        @@executors[queue]
      end
      def get_queue clazz
        raise NameError, "job class does not define a queue attribute and no was override specified" unless clazz.instance_variable_defined? :@queue

        clazz.instance_variable_get :@queue
      end
      def create_on_upon_methods strategy, queue
        on_method = (strategy.to_s + "_on_" + queue.to_s).to_sym
        upon_method = (strategy.to_s + "_upon_" + queue.to_s).to_sym

        [on_method, upon_method].each do |method|
          send :define_singleton_method, method do |*arguments|
            arguments.unshift queue
            send strategy, arguments
          end
        end
      end
      def hash_arguments arguments
        hash = {}

        if arguments[0].is_a? Class
          hash[:clazz] = arguments.shift
          hash[:queue] = get_queue hash[:clazz]
        else
          hash[:queue] = arguments.shift
          hash[:clazz] = arguments.shift
        end

        if arguments[0].is_a? ActiveSupport::Duration
          hash[:start] = arguments.shift
        end

        hash[:arguments] = arguments

        hash
      end
    end
  end
end