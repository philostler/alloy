# Test::Alloy
Object.const_set("Test", Class.new).const_set("Alloy", Class.new)

# Test::Alloy::Core
Test::Alloy.const_set("Core", Class.new)

# Test::Alloy::Core::Config
Test::Alloy::Core.const_set("Config", Class.new)
Test::Alloy::Core::Config.send :extend, Alloy::Core::Config

# Test::Alloy::Core::Size
Test::Alloy::Core.const_set("Size", Class.new)
Test::Alloy::Core::Size.send :extend, Alloy::Core::Size

# Test::Alloy::Core::Strategies
Test::Alloy::Core.const_set("Strategies", Class.new)
Test::Alloy::Core::Strategies.send :extend, Alloy::Core::Executors
Test::Alloy::Core::Strategies.send :extend, Alloy::Core::Jobs
Test::Alloy::Core::Strategies.send :extend, Alloy::Core::Size
Test::Alloy::Core::Strategies.send :extend, Alloy::Core::Strategies

# Test::Alloy::Job
Test::Alloy.const_set("Job", Class.new)

# Test::Alloy::Job::Able
Test::Alloy::Job.const_set("Able", Class.new)
Test::Alloy::Job::Able.send :include, Alloy::Job::Able