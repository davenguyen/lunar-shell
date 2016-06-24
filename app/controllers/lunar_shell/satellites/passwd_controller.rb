module LunarShell
  module Satellites
    class PasswdController < LunarShell::SatellitesController
      def run
        render 'no_user_error' unless current_user
      end

      def new_password
      end

      def confirm_password
      end

      def create
        @message = if current_user.authenticate(current_password) &&
            current_user.update(passwd_params)
          'Password updated.'
        else
          'try again'
        end
      end

      private

      def current_password
        passwd_params[:current_password]
      end

      def passwd_params
        params.
          require(:user).
          permit(:current_password, :password, :password_confirmation)
      end
    end
  end
end
