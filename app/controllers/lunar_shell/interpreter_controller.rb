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

    def output
      "Command not found: #{command}."
    end
    helper_method :output
  end
end
