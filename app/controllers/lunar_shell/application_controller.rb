module LunarShell
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private

    def clear_current_user!
      session[:current_user_id] = nil
      @current_user = nil
    end
    helper_method :clear_current_user!

    def current_user
      @current_user ||= set_current_user
    end
    helper_method :current_user

    def set_current_user(id = nil)
      session[:current_user_id] = id if id.present?
      @current_user = LunarShell::User.find_by_id(session[:current_user_id])
    end
    helper_method :set_current_user
  end
end
