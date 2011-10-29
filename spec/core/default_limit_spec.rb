require "spec_helper"

describe Alloy::Core::DefaultLimit do
  before(:all) { @model = Test::Alloy::Core::DefaultLimit }

  it { @model.should allow_public_access_for_methods :default_limit }

  describe ".default_limit" do
    it "should return the default limit" do
      @model.default_limit.should be 10
    end

    context "when a limit is specified" do
      it "should set the default limit" do
        @model.default_limit 11

        @model.default_limit.should be 11
      end
      it "should return the new default limit" do
        @model.default_limit(12).should be 12
      end

      context "when limit is less than one" do
        it "should raise an argument error" do
          expect { @model.default_limit 0 }.to raise_error ArgumentError, "default limit cannot be less than 1"
        end
      end
    end
  end
end