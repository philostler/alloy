def sleep_until job
  Class.new do
    def initialize job
      @job = job
    end

    def done
      while not @job.done
        sleep 0.1
      end
    end
  end.new job
end

def this_thread
  Java::java.lang.Thread.current_thread
end