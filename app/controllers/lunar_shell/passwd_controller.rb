module LunarShell
  class PasswdController < LunarShell::ApplicationController
    def new
      render 'lunar_shell/satellites/passwd/new'
    end

    def confirm
      render 'lunar_shell/satellites/passwd/confirm'
    end

    def update
      @message = if current_user.authenticate(passwd_params[:current_password]) && current_user.update(passwd_params)
        'Password updated.'
      else
        'try again'
      end
      render 'lunar_shell/satellites/passwd/update'
    end

    private

    def passwd_params
      params.
        require(:user).
        permit(:current_password, :password, :password_confirmation)
    end
  end
end
