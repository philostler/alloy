module Alloy
  module Core
    module Config
      def config &block
        self.instance_eval &block unless rake?
      end

      private
      def rake?
        File.basename($0) == "rake"
      end
    end
  end
end