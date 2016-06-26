module LunarShell
  module Middleware
    class Interpreter
      def initialize(app, options = {})
        @app = app
      end

      def call(env)
        request = Rack::Request.new(env)

        if (input = request.delete_param('command_line')).present?
          params = input.split(' ')
          command = params.shift

          if command
            request.update_param('parameters', params) if params.any?
            request.update_param('command', command)

            run_path = LunarShell::Engine.routes.url_helpers.satellites_run_path
            env['PATH_INFO'] = run_path.gsub 'run', "#{command}/run"
          end
        end

        @app.call(env)
      end
    end
  end
end
