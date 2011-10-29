require "spec_helper"

describe Alloy do
  it { Alloy::VERSION.should == "0.1.0" }

  it { should be_a Alloy::Core::Common }
  it { should be_a Alloy::Core::Limit }
  it { should be_a Alloy::Core::RunOnce }
  it { should be_a Alloy::Core::Schedule }
end