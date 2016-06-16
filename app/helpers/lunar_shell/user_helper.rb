module LunarShell
  module UserHelper
    def current_user
      @current_user ||= LunarShell::User.find_by_id(session[:current_user_id])
    end

    def username
      current_user.try(:username)
    end
  end
end
