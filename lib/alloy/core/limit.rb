module Alloy
  module Core
    module Limit
      @@limits = Hash.new 10

      def limit queue, limit = nil
        raise ArgumentError, "limit cannot be less than 1" if limit.to_i < 1 unless limit.nil?

        if limit
          @@limits[queue] = limit.to_i
        else
          @@limits[queue] if @@limits.has_key? queue
        end
      end
    end
  end
end