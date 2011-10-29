module Alloy
  module Core
    module Limit
      @@limits = {}

      def limit queue, limit = nil
        if limit
          set_limit queue, limit
        else
          get_limit queue
        end
      end

      private
      def get_limit queue
        if @@limits.has_key? queue then @@limits[queue] else default_limit end
      end
      def set_limit queue, limit
        raise ArgumentError, "limit cannot be less than 1" if limit.to_i < 1

        @@limits[queue] = limit.to_i
      end
      def create_limit_methods queue
        get_method = ("limit_" + queue.to_s).to_sym
        set_method = (get_method.to_s + "=").to_sym

        send :define_singleton_method, get_method do
          get_limit queue
        end

        send :define_singleton_method, set_method do |limit|
          set_limit queue, limit
        end
      end
    end
  end
end