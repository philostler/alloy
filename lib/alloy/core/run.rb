module Alloy
  module Core
    module Run
      def run clazz
        Alloy::Poros::Run.new clazz, method(:run_callback)
      end

      private
      def run_callback poro
        begin
          clazz = poro.instance_variable_get(:@clazz)
          queue = get_queue clazz
          executor = get_executor(queue)
          job = create_job clazz

          execute_upon executor, job
        rescue Exception => error
        end
      end
      def execute_upon executor, job
        executor.submit job
      end
    end
  end
end