require "alloy/version"

require "alloy/poros/run"
require "alloy/poros/schedule"
require "alloy/poros/size"

require "alloy/core/base"
require "alloy/core/run"
require "alloy/core/schedule"
require "alloy/core/size"

require "alloy/job/able"

module Alloy
  extend Alloy::Core::Base
  extend Alloy::Core::Run
  extend Alloy::Core::Schedule
  extend Alloy::Core::Size
end