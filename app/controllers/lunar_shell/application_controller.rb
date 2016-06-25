module LunarShell
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private

    def current_user
      @current_user ||= log_in! session[:current_user_id]
    end
    helper_method :current_user

    def log_in!(username_or_id)
      uid = [username_or_id, nil]
      uid.reverse! if username_or_id.is_a?(String)

      @current_user = LunarShell::User.
        where('id = ? OR username = ?', *uid).
        first
      session[:current_user_id] = @current_user.try(:id)
      @current_user
    end
    helper_method :log_in!

    def log_out!
      @current_user = nil
      session[:current_user_id] = nil
    end
    helper_method :log_out!

    def username
      @username ||= current_user.try(:username)
    end
    helper_method :username
  end
end
