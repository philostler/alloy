# Capability
Object.const_set "Capability", Class.new
Capability.send :include, Alloy::Job::Capability