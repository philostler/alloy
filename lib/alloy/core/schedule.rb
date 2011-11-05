module Alloy
  module Core
    module Schedule
      def schedule clazz
        Alloy::Poros::Schedule.new clazz, method(:schedule_callback)
      end

      private
      def schedule_callback poro
        begin
          queue = get_queue poro.clazz
          executor = get_executor(queue)
          job = create_job poro.clazz

          execute_upon executor, job, poro.instance_variable_get(:@in), poro.instance_variable_get(:@every)
        rescue Exception => e
        end
      end
      def execute_upon executor, job, initial, every
        future = executor.schedule_at_fixed_rate job, initial, every, Java::java.util.concurrent.TimeUnit::SECONDS
      end
    end
  end
end