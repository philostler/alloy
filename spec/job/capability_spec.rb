require "spec_helper"

describe Alloy::Job::Capability do
  before(:each) { @model = Test::Alloy::Job::Capability.new }

  it { @model.should be_a Java::java.lang.Runnable }
  it { @model.should_not allow_public_access_for_methods :run }

  describe "#run" do
    it "should invoke execute" do
      @model.should_receive :execute

      @model.send :run
    end
  end
end