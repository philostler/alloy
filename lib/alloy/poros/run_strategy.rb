module Alloy
  module Poros
    class RunStrategy < Alloy::Poros::Strategy
      def now
        strategy_formed
      end
    end
  end
end