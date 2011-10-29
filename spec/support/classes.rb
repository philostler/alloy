# Test::Alloy
Object.const_set("Test", Class.new).const_set("Alloy", Class.new)

# Test::Alloy::Core
Test::Alloy.const_set("Core", Class.new)

# Test::Alloy::Core::DefaultLimit
Test::Alloy::Core.const_set("DefaultLimit", Class.new)
Test::Alloy::Core::DefaultLimit.send :extend, Alloy::Core::DefaultLimit

# Test::Alloy::Core::Limit
Test::Alloy::Core.const_set("Limit", Class.new)
Test::Alloy::Core::Limit.send :extend, Alloy::Core::DefaultLimit
Test::Alloy::Core::Limit.send :extend, Alloy::Core::Limit

# Test::Alloy::Core::RunOnce
Test::Alloy::Core.const_set("RunOnce", Class.new)
Test::Alloy::Core::RunOnce.send :extend, Alloy::Core::Common
Test::Alloy::Core::RunOnce.send :extend, Alloy::Core::RunOnce

# Test::Alloy::Core::Schedule
Test::Alloy::Core.const_set("Schedule", Class.new)
Test::Alloy::Core::Schedule.send :extend, Alloy::Core::Common
Test::Alloy::Core::Schedule.send :extend, Alloy::Core::Schedule

# Test::Alloy::Job
Test::Alloy.const_set("Job", Class.new)

# Test::Alloy::Job::Capability
Test::Alloy::Job.const_set("Capability", Class.new)
Test::Alloy::Job::Capability.send :include, Alloy::Job::Capability