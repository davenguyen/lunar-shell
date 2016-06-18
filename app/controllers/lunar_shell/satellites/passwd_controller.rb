module LunarShell
  module Satellites
    class PasswdController < LunarShell::SatellitesController
      def new
      end

      def confirm
      end

      def update
        @message = if current_user.authenticate(passwd_params[:current_password]) && current_user.update(passwd_params)
          'Password updated.'
        else
          'try again'
        end
      end

      private

      def passwd_params
        params.
          require(:user).
          permit(:current_password, :password, :password_confirmation)
      end
    end
  end
end
