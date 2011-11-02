module Alloy
  module Job
    module Able
      include Java::java.lang.Runnable

      private
      def run
        execute
      end
    end
  end
end