module LunarShell
  class Application < Rails::Application
    require 'middleware/run_command'
    config.middleware.insert_after Rack::ETag, RunCommand
  end
end
