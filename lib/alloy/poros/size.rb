module Alloy
  module Poros
    class Size
      @@default = 10

      def self.default
        self
      end
      def self.is
        @@default
      end
      def self.to size
        raise ArgumentError, "default size cannot be less than 1" if size < 1

        @@default = size
      end

      def is
        if @size then @size else self.class.is end
      end
      def to size
        raise ArgumentError, "size cannot be less than 1" if size < 1

        @size = size
      end
    end
  end
end