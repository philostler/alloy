module Alloy
  module Core
    module Strategies
      def run clazz
        Alloy::Poros::RunStrategy.new clazz, method(:strategy_formed)
      end
      def schedule clazz
        Alloy::Poros::ScheduleStrategy.new clazz, method(:strategy_formed)
      end

      private
      def execute_upon executor, job, in_duration = nil, every_duration = nil
        if every_duration
          executor.schedule_at_fixed_rate job, in_duration, every_duration, Java::java.util.concurrent.TimeUnit::SECONDS
        else
          executor.submit job
        end
      end
      def strategy_formed strategy
        begin
          clazz = strategy.clazz
          queue = get_queue clazz
          executor = get_executor queue
          job = create_job clazz

          execute_upon executor,
                       job,
                       strategy.in,
                       (strategy.every if strategy.respond_to? :every)
        rescue Exception => e
          #p e.to_s
        end
      end
    end
  end
end