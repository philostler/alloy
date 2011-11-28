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
      UNITS = Java::java.util.concurrent.TimeUnit::SECONDS

      def execute_upon executor, job, in_duration = nil, strictly = nil, every_duration = nil
        if every_duration
          if strictly
            executor.schedule_at_fixed_rate job, in_duration.to_i, every_duration.to_i, UNITS
          else
            executor.schedule_with_fixed_delay job, in_duration.to_i, every_duration.to_i, UNITS
          end
        else
          executor.submit job
        end
      end
      def strategy_formed strategy
        begin
          clazz = strategy.clazz
          queue = get_queue clazz
          executor = get_executor queue
          job = create_job clazz, strategy.with

          execute_upon executor,
                       job,
                       strategy.in,
                       (strategy.strictly? if strategy.respond_to? :strictly?),
                       (strategy.every if strategy.respond_to? :every)
        rescue Exception => e
          #p e.to_s
        end
      end
    end
  end
end