module LunarShell
  class InterpreterController < LunarShell::ApplicationController
    def create
      render 'clear' if command == 'clear'
    end

    private

    def arguments
      @arguments ||= params[:command_line].split(' ')
    end

    def command
      @command ||= arguments.shift
    end
    helper_method :command

    def satellite
      @satellite ||= LunarShell::Satellite[command, current_user, arguments]
    end
    helper_method :satellite

    def output
      satellite.try(:run) || "Command not found: #{command}."
    end
    helper_method :output
  end
end
