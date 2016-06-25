module LunarShell
  class Engine < ::Rails::Engine
    isolate_namespace LunarShell

    initializer 'lunar_shell.add_middleware' do |app|
      app.middleware.insert_after Rack::ETag, LunarShell::Middleware::Interpreter
    end

    initializer "lunar_shell.assets.precompile" do |app|
      app.config.assets.precompile += %w(lunar_shell.coffee lunar_shell.sass)
    end
  end
end
