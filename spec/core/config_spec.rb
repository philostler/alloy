require "spec_helper"

describe Alloy::Core::Config do
  subject { Test::Alloy::Core::Config }

  it { subject.should allow_public_access_for_methods :config }

  describe ".config" do
    it "should execute the specified block" do
      subject.config do
        true
      end.should be_true
    end
  end
end