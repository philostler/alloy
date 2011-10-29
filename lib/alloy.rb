require "alloy/version"

require "alloy/core/common"
require "alloy/core/default_limit"
require "alloy/core/limit"
require "alloy/core/run_once"
require "alloy/core/schedule"

require "alloy/job/capability"

module Alloy
  extend Alloy::Core::Common
  extend Alloy::Core::DefaultLimit
  extend Alloy::Core::Limit
  extend Alloy::Core::RunOnce
  extend Alloy::Core::Schedule
end