require "spec_helper"

describe Alloy::Core::Size do
  subject { Test::Alloy::Core::Size }

  it { subject.should allow_public_access_for_methods :size }

  describe ".size" do
    it "should return the size poro class" do
      subject.size.should be Alloy::Poros::Size
    end

    context "when a queue is specified" do
      it "should return a size poro instance" do
        subject.size(:queue).should be_a Alloy::Poros::Size
      end
    end
  end
end