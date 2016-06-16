module LunarShell
  class ShellsController < ApplicationController
    before_action :initialize_shell

    def show
    end

    private

    def initialize_shell
      session[:prompt] = USER_PROMPT
      session[:current_user_id] = nil
    end
  end
end
