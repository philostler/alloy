module Alloy
  module Core
    module Config
      def config &block
        self.instance_eval &block
      end
    end
  end
end