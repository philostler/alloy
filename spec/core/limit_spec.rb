require "spec_helper"

describe Alloy::Core::Limit do
  before(:all) { @model = Test::Alloy::Core::Limit }

  it { @model.should allow_public_access_for_methods :limit }

  describe ".limit" do
    it "should return the specified queue limit" do
      @model.limit example.description, 7

      @model.limit(example.description).should be 7
    end

    it "should return nil if the queue does not exist" do
      @model.limit(nil).should be_nil
    end

    context "when a limit is specified" do
      it "should set the specified queue limit" do
        @model.limit example.description, 10

        @model.limit(example.description).should be 10
      end

      it "should return the new limit" do
        @model.limit(example.description, 10).should be 10
      end

      context "when limit is less than one" do
        it "should raise an argument error" do
          expect { @model.limit example.description, 0 }.to raise_error ArgumentError, "limit cannot be less than 1"
        end
      end
    end
  end
end