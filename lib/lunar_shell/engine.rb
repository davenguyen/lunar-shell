module LunarShell
  class Engine < ::Rails::Engine
    isolate_namespace LunarShell

    initializer 'lunar_shell.add_middleware' do |app|
      app.middleware.insert_after Rack::ETag, LunarShell::Middleware::Interpreter
    end

    initializer "lunar_shell.assets.precompile" do |app|
      app.config.assets.precompile += %w(lunar_shell.coffee lunar_shell.sass)
    end

    config.app_generators.satellite :satellite

    def mount_path
      @mount_path ||= routes.url_helpers.root_path[0..-2]
    end

    def run_command_path(command)
      run_path.gsub('run', "#{command}/run")
    end

    def run_path
      @run_path ||= routes.url_helpers.satellites_run_path
    end
  end
end
