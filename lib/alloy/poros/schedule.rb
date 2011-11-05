module Alloy
  module Poros
    class Schedule
      def initialize clazz, callback
        @clazz = clazz
        @callback = callback
      end

      def clazz
        @clazz
      end
      def every duration
        @every = duration
        @callback.call self
      end
      def in duration
        @in = duration

        self
      end
    end
  end
end