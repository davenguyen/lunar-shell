module LunarShell
  class Engine < ::Rails::Engine
    isolate_namespace LunarShell

    initializer 'lunar_shell.add_middleware' do |app|
      app.middleware.insert_after Rack::ETag, LunarShell::Middleware::Interpreter
    end
  end
end
