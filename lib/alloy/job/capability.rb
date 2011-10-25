module Alloy
  module Job
    module Capability
      include Java::java.lang.Runnable

      private
      def run
        execute
      end
    end
  end
end