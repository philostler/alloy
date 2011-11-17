module Alloy
  module Job
    module Able
      include Java::java.lang.Runnable

      attr_writer :arguments

      private
      def run
        begin
          if @arguments.nil? then execute else execute *@arguments end
        rescue Exception => exception
          p exception.to_s
        end
      end
    end
  end
end