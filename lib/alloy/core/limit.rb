module Alloy
  module Core
    module Limit
      @@limits = Hash.new 10

      def limit queue, limit = nil
        raise ArgumentError, "limit cannot be less than 1" if limit.to_i < 1 unless limit.nil?

        if limit.nil?
          if @@limits.has_key? queue
            @@limits[queue]
          else
            return nil
          end
        else
          @@limits[queue] = limit.to_i
        end
      end
    end
  end
end