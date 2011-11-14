require "spec_helper"

describe Alloy::Core::Strategies do
  subject { Test::Alloy::Core::Strategies }
  let(:clazz) { ExecutionInfoJob }
  let(:job) { clazz.new }

  it { subject.should allow_public_access_for_methods :run, :schedule }

  describe ".run" do
    it "should execute the specified job once" do
      subject.should_receive(:create_job).once.and_return job

      subject.run(clazz).now

      should_execute(job).once
    end
    it "should execute the specified job upon the job's specified queue" do
      queue = clazz.instance_variable_get :@queue

      subject.should_receive(:get_executor).with queue

      subject.run(clazz).now
    end
    it "should execute the specified job upon a seperate thread" do
      subject.should_receive(:create_job).once.and_return job

      subject.run(clazz).now

      should_execute(job).once
      job.thread.id.should_not be this_thread.id
    end
  end

  describe ".schedule" do
    it "should execute the specified job multiple times" do
      subject.should_receive(:create_job).once.and_return job

      subject.schedule(clazz).every 1

      should_execute(job).twice
    end
    it "should execute the specified job upon the job's specified queue" do
      queue = clazz.instance_variable_get :@queue

      subject.should_receive(:get_executor).with queue

      subject.schedule(clazz).every 1
    end
    it "should execute the specified job upon a seperate thread" do
      subject.should_receive(:create_job).once.and_return job

      subject.schedule(clazz).every 10

      should_execute(job).once
      job.thread.id.should_not be this_thread.id
    end
    it "should execute the specified job once within the 'in' duration" do
      subject.should_receive(:create_job).once.and_return job

      subject.schedule(clazz).in(1).every 10

      should_execute(job).within(2).seconds.once
    end
    it "should execute the specified job once within the 'every' duration" do
      subject.should_receive(:create_job).once.and_return job

      subject.schedule(clazz).every 1

      should_execute(job).within(2).seconds.twice
    end

    context "when an 'in' duration is not specified" do
      it "should execute the specified job immediately" do
        subject.should_receive(:create_job).once.and_return job

        subject.schedule(clazz).every 5

        should_execute(job).within(2).seconds.once
      end
    end
    context "when an 'in' duration is less than one" do
      it "should raise an argument error" do
        expect { subject.schedule(clazz).in(0).every 1 }.to raise_error ArgumentError, "an 'in' duration cannot be less than 1"
      end
    end

    context "when an 'every' duration is not specified" do
      it "should not execute the specified job" do
        job.should_not_receive :execute

        subject.schedule(clazz).in 1
      end
    end
    context "when an 'every' duration is less than one" do
      it "should raise an argument error" do
        expect { subject.schedule(clazz).in(1).every 0 }.to raise_error ArgumentError, "an 'every' duration cannot be less than 1"
      end
    end
  end
end