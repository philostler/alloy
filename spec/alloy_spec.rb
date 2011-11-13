require "spec_helper"

describe Alloy do
  it { Alloy::VERSION.should == "0.1.0" }

  it { should be_a Alloy::Core::Executors }
  it { should be_a Alloy::Core::Jobs }
  it { should be_a Alloy::Core::Size }
  it { should be_a Alloy::Core::Strategies }
end