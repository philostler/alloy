module Alloy
  module Poros
    class Schedule
      def initialize clazz, callback
        @clazz = clazz
        @callback = callback
      end

      def every duration
        raise ArgumentError, "an 'every' duration cannot be less than 1" if duration < 1

        @every = duration
        @callback.call self
      end
      def in duration
        raise ArgumentError, "an 'in' duration cannot be less than 1" if duration < 1

        @in = duration

        self
      end
    end
  end
end