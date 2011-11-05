module Alloy
  module Core
    module Run
      def run clazz
        Alloy::Poros::Run.new clazz, method(:run_callback)
      end

      private
      def run_callback poro
        begin
          queue = get_queue poro.clazz
          executor = get_executor(queue)
          job = create_job poro.clazz

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