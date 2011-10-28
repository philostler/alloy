require "alloy/version"

require "alloy/core/limit"
require "alloy/core/run_once"

require "alloy/job/capability"

module Alloy
  extend Alloy::Core::Limit
  extend Alloy::Core::RunOnce
end