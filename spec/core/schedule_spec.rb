require "spec_helper"

describe Alloy::Core::Schedule do
  subject { Test::Alloy::Core::Schedule }
  let(:clazz) { TestJob }
  let(:job) { clazz.new }

  it { subject.should allow_public_access_for_methods :schedule }

  describe ".schedule" do
    it "should execute the specified job multiple times" do
      job.should_receive(:execute).at_least(2).times

      subject.should_receive(:create_job).once.and_return job

      subject.schedule(clazz).every 1

      sleep 2
    end
    it "should execute the specified job upon the job's specified queue" do
      queue = clazz.instance_variable_get :@queue

      subject.should_receive(:get_executor).with queue

      subject.schedule(clazz).every 10
    end
    it "should execute the specified job upon a seperate thread" do
      subject.should_receive(:create_job).once.and_return job

      subject.schedule(clazz).every 1

      sleep_until(job).done

      job.thread.id.should_not be this_thread.id
    end
  end
end