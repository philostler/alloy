require "spec_helper"

describe Alloy::Poros::Size do
  before(:each) {
    @clazz = described_class
    @model = described_class.new
  }

  it { @clazz.should allow_public_access_for_methods :default, :is, :to }
  it { @model.should allow_public_access_for_methods :is, :to }

  describe ".default" do
    it "should return itself" do
      @clazz.default.should be @clazz
    end
  end

  describe ".is" do
    it "should return the default size" do
      @clazz.is.should be 10
    end
  end

  describe ".to" do
    it "should set the default size" do
      @clazz.to(7)

      @clazz.is.should be 7
    end
    it "should return the new default size" do
      @clazz.to(5).should be 5
    end

    context "when size is less than one" do
      it "should raise an argument error" do
        expect { @clazz.to 0 }.to raise_error ArgumentError, "default size cannot be less than 1"
      end
    end
  end

  describe "#is" do
    it "should return size" do
      @model.to 10

      @model.is.should be 10
    end

    context "when size is nil" do
      it "should return the default size" do
        @model.is.should be @clazz.is
      end
    end
  end

  describe "#to" do
    it "should set the size" do
      @model.to(7)

      @model.is.should be 7
    end
    it "should return the new size" do
      @model.to(5).should be 5
    end

    context "when size is less than one" do
      it "should raise an argument error" do
        expect { @model.to 0 }.to raise_error ArgumentError, "size cannot be less than 1"
      end
    end
  end
end