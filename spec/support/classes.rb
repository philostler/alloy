# Test::Alloy
Object.const_set("Test", Class.new).const_set("Alloy", Class.new)

# Test::Alloy::Core
Test::Alloy.const_set("Core", Class.new)

# Test::Alloy::Core::Run
Test::Alloy::Core.const_set("Run", Class.new)
Test::Alloy::Core::Run.send :extend, Alloy::Core::Base
Test::Alloy::Core::Run.send :extend, Alloy::Core::Run
Test::Alloy::Core::Run.send :extend, Alloy::Core::Size

# Test::Alloy::Core::Schedule
Test::Alloy::Core.const_set("Schedule", Class.new)
Test::Alloy::Core::Schedule.send :extend, Alloy::Core::Base
Test::Alloy::Core::Schedule.send :extend, Alloy::Core::Schedule
Test::Alloy::Core::Schedule.send :extend, Alloy::Core::Size

# Test::Alloy::Core::Size
Test::Alloy::Core.const_set("Size", Class.new)
Test::Alloy::Core::Size.send :extend, Alloy::Core::Size

# Test::Alloy::Job
Test::Alloy.const_set("Job", Class.new)

# Test::Alloy::Job::Able
Test::Alloy::Job.const_set("Able", Class.new)
Test::Alloy::Job::Able.send :include, Alloy::Job::Able