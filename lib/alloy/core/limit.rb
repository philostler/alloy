module Alloy
  module Core
    module Limit
      @@limits = Hash.new

      def limit queue, limit = nil
        raise ArgumentError, "limit cannot be less than 1" if limit.to_i < 1 unless limit.nil?

        if limit.nil?
          @@limits[queue]
        else
          @@limits[queue] = limit.to_i
        end
      end
    end
  end
end