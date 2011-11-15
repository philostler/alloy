module Alloy
  class JobGenerator < Rails::Generators::NamedBase
    source_root File.expand_path "../templates", __FILE__

    def job
      template File.join("jobs", "job.rb"), File.join("app", "jobs", file_name + ".rb")
    end
  end
end