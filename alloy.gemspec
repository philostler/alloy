# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "alloy/version"

Gem::Specification.new do |s|
  s.name        = "alloy"
  s.version     = Alloy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = "Phil Ostler"
  s.email       = "philostler@gmail.com"
  s.homepage    = "http://philostler.github.com/alloy"
  s.summary     = %q{Fluent interface for Java's Executor framework}
  s.description = %q{Fluent interface for Java's Executor framework with added job handling ingredients}

  s.files = Dir[".rspec"] +
            Dir["alloy.gemspec"] +
            Dir["Gemfile"] +
            Dir["LICENSE"] +
            Dir["Rakefile"] +
            Dir["**/*.rb"]
  s.require_paths = ["lib"]

  s.add_dependency "activesupport", ">= 2.3"

  s.add_development_dependency "rspec", "~> 2.0"
end