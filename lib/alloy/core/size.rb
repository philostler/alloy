module Alloy
  module Core
    module Size
      @@sizes = Hash.new Alloy::Poros::Size

      def size queue = nil
        get_size queue
      end

      private
      def get_size queue
        @@sizes[queue] = Alloy::Poros::Size.new if queue unless @@sizes.has_key? queue

        @@sizes[queue]
      end
    end
  end
end