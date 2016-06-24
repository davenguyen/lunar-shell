class RunCommand
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

        env['PATH_INFO'] = "/satellites/#{command}/run"
      end
    end

    @app.call(env)
  end
end
