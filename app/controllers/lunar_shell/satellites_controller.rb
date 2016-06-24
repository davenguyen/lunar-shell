module LunarShell
  class SatellitesController < LunarShell::ApplicationController
    def run
      render 'no_command'
    end

    def error
      render 'no_command' and return unless command
      render 'clear' and return if command == 'clear'
      render 'command_not_found'
    end

    private

    def command
      @command ||= params[:command]
    end
    helper_method :command
  end
end
