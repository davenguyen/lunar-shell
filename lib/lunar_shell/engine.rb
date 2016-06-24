module LunarShell
  class Engine < ::Rails::Engine
    isolate_namespace LunarShell

    initializer 'lunar_shell.add_middleware' do |app|
      app.middleware.insert_after Rack::ETag, LunarShell::Middleware::RunCommand
    end
  end
end
