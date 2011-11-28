require "spec_helper"

describe Alloy::Poros::ScheduleStrategy do
  subject { described_class.new nil, nil }

  it { subject.should allow_public_access_for_methods :every, :strictly, :strictly? }

  describe "#every" do
    it "should return the every duration" do
      subject.stub :strategy_formed

      subject.every 5

      subject.every.should be 5
    end

    context "when a duration is specified" do
      it "should set the every duration" do
        subject.stub :strategy_formed

        subject.every.should be_nil

        subject.every 7

        subject.every.should be 7
      end
      it "should invoke strategy_formed" do
        subject.should_receive(:strategy_formed).once

        subject.every 9
      end

      context "when duration is less than one" do
        it "should raise an argument error" do
          expect { subject.every 0 }.to raise_error ArgumentError, "an 'every' duration cannot be less than 1"
        end
      end
    end
  end

  describe "#strictly" do
    it "should set the strictly boolean" do
      subject.strictly

      subject.instance_variable_get(:@strictly).should be_true
    end
    it "should return itself" do
      subject.strictly.should be subject
    end
  end

  describe "#strictly?" do
    it "should return the strictly boolean" do
      subject.strictly

      subject.strictly?.should be_true
    end
  end
end