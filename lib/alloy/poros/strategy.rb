module Alloy
  module Poros
    class Strategy
      def initialize clazz, strategy_formed_handler
        @clazz = clazz
        @strategy_formed_handler = strategy_formed_handler
      end

      def clazz
        @clazz
      end
      def in duration = nil
        if duration
          set_in duration
          self
        else
          get_in
        end
      end

      private
      def get_in
        @in
      end
      def set_in duration
        raise ArgumentError, "an 'in' duration cannot be less than 1" if duration < 1

        @in = duration
      end
      def strategy_formed
        @strategy_formed_handler.call self
      end
    end
  end
end