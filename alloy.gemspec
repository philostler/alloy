# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "alloy/version"

Gem::Specification.new do |s|
  s.name        = "alloy"
  s.version     = Alloy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Phil Ostler"]
  s.email       = ["philostler@gmail.com"]
  s.homepage    = "https://github.com/philostler/alloy"
  s.summary     = %q{}
  s.description = %q{}

  s.files = Dir[".rspec"] +
            Dir["alloy.gemspec"] +
            Dir["Gemfile"] +
            Dir["LICENSE"] +
            Dir["Rakefile"] +
            Dir["**/*.rb"]
  s.require_paths = ["lib"]

  s.add_dependency "activesupport"

  s.add_development_dependency "rspec"
end