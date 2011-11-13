require "alloy/version"

require "alloy/poros/strategy"
require "alloy/poros/run_strategy"
require "alloy/poros/schedule_strategy"
require "alloy/poros/size"

require "alloy/core/executors"
require "alloy/core/jobs"
require "alloy/core/size"
require "alloy/core/strategies"

require "alloy/job/able"

module Alloy
  extend Alloy::Core::Executors
  extend Alloy::Core::Jobs
  extend Alloy::Core::Size
  extend Alloy::Core::Strategies
end