require "spec_helper"

describe Alloy::Core::Limit do
  before(:all) { @model = Test::Alloy::Core::Limit }

  it { @model.should allow_public_access_for_methods :limit }

  describe ".limit" do
    context "when the specified queue's limit has been set" do
      it "should return the specified queue's limit" do
        @model.limit example.description, 7

        @model.limit(example.description).should be 7
      end
    end

    context "when the specified queue's limit has not been set" do
      it "should return the default queue limit" do
        default_limit = @model.default_limit

        @model.limit(example.description).should be default_limit
      end
    end

    context "when a limit is specified" do
      it "should set the specified queue's limit" do
        @model.limit example.description, 7

        @model.limit(example.description).should be 7
      end
      it "should return the specified queue's new limit" do
        @model.limit(example.description, 7).should be 7
      end

      context "when limit is less than one" do
        it "should raise an argument error" do
          expect { @model.limit example.description, 0 }.to raise_error ArgumentError, "limit cannot be less than 1"
        end
      end
    end
  end
end