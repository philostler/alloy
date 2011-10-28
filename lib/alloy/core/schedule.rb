module Alloy
  module Core
    module Schedule
      def schedule *arguments
        if arguments[0].is_a? Class
          clazz = arguments.shift
          queue = get_queue clazz
        else
          queue = arguments.shift
          clazz = arguments.shift
        end
      end
    end
  end
end