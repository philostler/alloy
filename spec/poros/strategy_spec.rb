require "spec_helper"

describe Alloy::Poros::Strategy do
  subject { described_class.new Class, nil }

  it { subject.should allow_public_access_for_methods :clazz, :in }

  describe "#clazz" do
    it "should return the clazz" do
      subject.clazz.should be Class
    end
  end

  describe "#in" do
    it "should return the in duration" do
      subject.in 5

      subject.in.should be 5
    end

    context "when a duration is specified" do
      it "should set the in duration" do
        subject.in 7

        subject.in.should be 7
      end
      it "should return itself" do
        subject.in(9).should be subject
      end

      context "when duration is less than one" do
        it "should raise an argument error" do
          expect { subject.in 0 }.to raise_error ArgumentError, "an 'in' duration cannot be less than 1"
        end
      end
    end
  end
end