class ExecutionInfoJob
  include Alloy::Job::Able

  @queue = :test_queue

  attr_reader :execution_count, :thread

  def execute
    begin
      @thread = Java::java.lang.Thread.current_thread
    ensure
      @execution_count = @execution_count.to_i + 1
    end
  end
end