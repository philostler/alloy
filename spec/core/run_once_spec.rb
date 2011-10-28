require "spec_helper"

describe Alloy::Core::RunOnce do
  before(:all) { @model = Test::Alloy::Core::RunOnce }

  it { @model.should allow_public_access_for_methods :run_once }

  describe ".run_once" do
    it "should execute the the specified job once" do
      job_clazz = Test::Alloy::Job::Capability

      job_instance = job_clazz.new
      job_instance.should_receive(:execute).once

      @model.should_receive(:limit).and_return 1
      @model.should_receive(:create_job_instance).and_return job_instance

      @model.run_once :queue, job_clazz
    end

    context "when the specified job does not have a queue attribute" do
      it "should raise an argument error" do
        expect { @model.run_once Test::Alloy::Job::Capability }.to raise_error ArgumentError, "job does not have a queue attribute defined"
      end
    end
  end
end