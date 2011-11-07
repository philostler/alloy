module Alloy
  module Core
    module Schedule
      def schedule clazz
        Alloy::Poros::Schedule.new clazz, method(:schedule_callback)
      end

      private
      def schedule_callback poro
        begin
          clazz = poro.instance_variable_get(:@clazz)
          queue = get_queue clazz
          executor = get_executor(queue)
          job = create_job clazz

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