require "spec_helper"

describe Alloy::Core::Run do
  subject { Test::Alloy::Core::Run }
  let(:clazz) { TestJob }
  let(:job) { clazz.new }

  it { subject.should allow_public_access_for_methods :run }

  describe ".run" do
    it "should execute the specified job once" do
      job.should_receive(:execute).once

      subject.should_receive(:create_job).once.and_return job

      subject.run(clazz).now
    end
    it "should execute the specified job upon the job's specified queue" do
      queue = clazz.instance_variable_get :@queue

      subject.should_receive(:get_executor).with queue

      subject.run(clazz).now
    end
    it "should execute the specified job upon a seperate thread" do
      subject.should_receive(:create_job).once.and_return job

      subject.run(clazz).now

      sleep_until(job).done

      job.thread.id.should_not be this_thread.id
    end
  end
end