require "spec_helper"

describe Alloy::Job::Able do
  subject { Test::Alloy::Job::Able.new }

  it { subject.should be_a Java::java.lang.Runnable }
  it { subject.should_not allow_public_access_for_methods :run }

  describe "#run" do
    it "should invoke execute" do
      subject.should_receive :execute

      subject.send :run
    end
  end
end