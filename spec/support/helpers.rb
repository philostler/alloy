def should_execute job
  Class.new do
    include RSpec::Matchers

    def initialize job
      @job = job
      @start_time = Time.now
      @within = 10
    end

    def once
      while @job.execution_count.to_i < 1 && !timed_out
        sleep 0.1
      end
      @job.execution_count.should be 1
    end
    def seconds
      self
    end
    def twice
      while @job.execution_count.to_i < 2 && !timed_out
        sleep 0.1
      end
      @job.execution_count.should be 2
    end
    def within duration
      @within = duration

      self
    end

    private
    def timed_out
      true unless Time.now - @start_time < @within
    end
  end.new job
end

def this_thread
  Java::java.lang.Thread.current_thread
end