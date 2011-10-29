module Alloy
  module Core
    module DefaultLimit
      @@default_limit = 10

      def default_limit limit = nil
        if limit
          set_default_limit limit.to_i
        else
          get_default_limit
        end
      end

      private
      def get_default_limit
        @@default_limit
      end
      def set_default_limit limit
        raise ArgumentError, "default limit cannot be less than 1" if limit.to_i < 1

        @@default_limit = limit.to_i
      end
    end
  end
end