module LunarShell
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private

    def current_user
      @current_user ||= LunarShell::User.find_by_id(session[:current_user_id])
    end
    helper_method :current_user
  end
end
