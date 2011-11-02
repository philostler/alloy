require "spec_helper"

describe Alloy::Core::Size do
  before(:all) { @clazz = Test::Alloy::Core::Size }

  it { @clazz.should allow_public_access_for_methods :size }

  describe ".size" do
    it "should return the size poro class" do
      @clazz.size.should be Alloy::Poros::Size
    end

    context "when a queue is specified" do
      it "should return a size poro instance" do
        @clazz.size(:queue).should be_a Alloy::Poros::Size
      end
    end
  end
end