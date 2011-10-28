require "spec_helper"

describe Alloy::Core::RunOnce do
  before(:all) { @model = Test::Alloy::Core::RunOnce }

  it { @model.should allow_public_access_for_methods :run_once }

  describe ".run_once" do
    it "should execute the the specified job once" do
      job_clazz = Test::Alloy::Job::Capability

      job_instance = job_clazz.new
      job_instance.should_receive(:execute).once

      @model.should_receive(:get_limit).and_return 1
      @model.should_receive(:create_job).and_return job_instance

      future = @model.run_once :queue, job_clazz
      future.get
    end

    context "when the specified job does not have a queue attribute" do
      it "should raise an argument error" do
        expect { @model.run_once Test::Alloy::Job::Capability }.to raise_error NameError, "job class does not define a queue attribute and no was override specified"
      end
    end
  end
end