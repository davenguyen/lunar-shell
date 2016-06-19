module LunarShell
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private

    def clear_current_user!
      @current_user = nil
      session[:current_user_id] = nil
    end
    helper_method :clear_current_user!

    def current_user
      @current_user ||= set_current_user!(session[:current_user_id])
    end
    helper_method :current_user

    def set_current_user!(id)
      session[:current_user_id] = id
      @current_user = LunarShell::User.find_by_id(id)
    end
    helper_method :set_current_user!
  end
end
