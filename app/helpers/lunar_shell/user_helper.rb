module LunarShell
  module UserHelper
    def username
      current_user.try(:username)
    end
  end
end
