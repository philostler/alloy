require "spec_helper"

describe Alloy::Poros::RunStrategy do
  subject { described_class.new nil, nil }

  it { subject.should allow_public_access_for_methods :now }

  describe "#now" do
    it "should invoke formed_strategy" do
      subject.should_receive(:strategy_formed).once

      subject.now
    end
  end
end