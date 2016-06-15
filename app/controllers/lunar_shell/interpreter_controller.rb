module LunarShell
  class InterpreterController < ApplicationController
    def create
    end

    private

    def arguments
      @arguments ||= params[:command_line].split(' ')
    end

    def command
      @command ||= arguments.shift
    end

    def satellite
      @satellite ||= LunarShell::Satellite[command, arguments]
    end

    def output
      satellite.try(:run) || "Command not found: #{command}."
    end
    helper_method :output
  end
end
