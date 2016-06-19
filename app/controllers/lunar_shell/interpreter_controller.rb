module LunarShell
  class InterpreterController < LunarShell::ApplicationController
    def create
      render 'no_command' and return unless command
      render 'clear' and return if command == 'clear'
      @output = "Command not found: #{command}." and return unless satellite
      satellite.run!
      render satellite_template if satellite_template?
    end

    private

    def arguments
      @arguments ||= params[:command_line].split(' ')
    end

    def command
      @command ||= arguments.shift
    end
    helper_method :command

    def output
      @output ||= satellite.output
    end
    helper_method :output

    def satellite
      @satellite ||= LunarShell::Satellite[command, current_user, arguments]
    end
    helper_method :satellite

    def satellite_partial
      "lunar_shell/satellites/#{command}/_#{satellite.view_partial}"
    end
    helper_method :satellite_partial

    def satellite_partial?
      return false unless satellite
      lookup_context.exists?(satellite_partial)
    end
    helper_method :satellite_partial?

    def satellite_template
      "lunar_shell/satellites/#{command}/#{satellite.view_template}"
    end
    helper_method :satellite_template

    def satellite_template?
      return false unless satellite
      lookup_context.exists?(satellite_template)
    end
    helper_method :satellite_template?
  end
end
