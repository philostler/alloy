def should_execute job
  Class.new do
    include RSpec::Matchers

    def initialize job
      @job = job
      @start_time = Time.now
      @within = 10
    end

    def once
      sleep_until_execution_count 1
    end
    def seconds
      self
    end
    def twice
      sleep_until_execution_count 2
    end
    def within duration
      @within = duration

      self
    end

    private
    def sleep_until_execution_count count
      while @job.execution_count.to_i < count && !timed_out
        sleep 0.1
      end
      @job.execution_count.should be count
    end
    def timed_out
      Time.now - @start_time > @within
    end
  end.new job
end

def this_thread
  Java::java.lang.Thread.current_thread
end