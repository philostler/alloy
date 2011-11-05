class TestJob
  include Alloy::Job::Able

  @queue = :test_queue

  attr_reader :done, :thread

  def execute
    begin
      @thread = Java::java.lang.Thread.current_thread
    ensure
      @done = true
    end
  end
end