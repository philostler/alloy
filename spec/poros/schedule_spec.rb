require "spec_helper"

describe Alloy::Poros::Schedule do
  subject { described_class.new nil, nil }

  it { subject.should allow_public_access_for_methods :every, :in }

  describe "#every" do
    it "should set the every"
    it "should invoke callback"

    context "when every is less than one" do
      it "should raise an argument error"
    end
  end

  describe "#in" do
    it "should set the in"
    it "should return itself"

    context "when in is less than one" do
      it "should raise an argument error"
    end
  end
end