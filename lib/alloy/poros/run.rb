module Alloy
  module Poros
    class Run
      def initialize clazz, callback
        @clazz = clazz
        @callback = callback
      end

      def now
        @callback.call self
      end
      def clazz
        @clazz
      end
    end
  end
end