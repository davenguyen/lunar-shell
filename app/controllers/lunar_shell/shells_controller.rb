module LunarShell
  class ShellsController < LunarShell::ApplicationController
    before_action :initialize_shell

    def show
    end

    private

    def initialize_shell
      session[:prompt] = USER_PROMPT
      session[:current_user_id] ||= nil
      session[:history] = []
      session[:history_index] = 0
    end
  end
end
