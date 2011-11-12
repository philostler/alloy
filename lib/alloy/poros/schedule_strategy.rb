module Alloy
  module Poros
    class ScheduleStrategy < Alloy::Poros::Strategy
      def every duration = nil
        if duration
          set_every duration
          strategy_formed
        else
          get_every
        end
      end

      private
      def get_every
        @every
      end
      def set_every duration
        raise ArgumentError, "an 'every' duration cannot be less than 1" if duration < 1

        @every = duration
      end
    end
  end
end