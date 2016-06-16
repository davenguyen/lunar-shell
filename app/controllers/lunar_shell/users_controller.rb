module LunarShell
  class UsersController < LunarShell::ApplicationController
    def update
      @message = if current_user.update(password: password)
        'Password updated.'
      else
        'Password not updated.'
      end
    end

    private

    def password
      params[:user][:password].presence
    end
  end
end
