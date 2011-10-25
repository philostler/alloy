module Alloy
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path "../templates", __FILE__

    def initializer
      template File.join("initializers", "alloy.rb"), File.join("config", "initializers", "alloy.rb")
    end
  end
end