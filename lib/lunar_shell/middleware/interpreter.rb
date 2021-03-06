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

            env['PATH_INFO'] = LunarShell::Engine.run_command_path(command)
          end
        end

        @app.call(env)
      end
    end
  end
end
