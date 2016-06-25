module LunarShell
  class SatellitesController < LunarShell::ApplicationController
    PUBLIC = true

    before_action :log_command!

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

    def history
      @history ||= session[:history]
    end

    def parameters
      @parameters ||= params[:parameters]
    end
    helper_method :parameters

    def log_command!
      return if !command || command == 'history'
      session[:history] << "#{command} #{parameters.try :join, ' '}".strip
      session[:history_index] = session[:history].count
    end
  end
end
