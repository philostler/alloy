require "spec_helper"

describe Alloy::Poros::Run do
  subject { described_class.new nil, nil }

  it { subject.should allow_public_access_for_methods :now }

  describe "#now" do
    it "should invoke callback"
  end
end