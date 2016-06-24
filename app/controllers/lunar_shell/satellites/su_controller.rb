module LunarShell
  module Satellites
    class SuController < LunarShell::SatellitesController
      def run
        render 'no_username' and return unless provided_username
      end

      def create
        set_current_user!(su_params[:username])
        unless current_user.try(:authenticate, su_params[:password])
          clear_current_user!
          @error_message = 'Sorry'
        end
      end

      private

      def provided_username
        @provided_username ||= parameters.try(:first)
      end
      helper_method :provided_username

      def su_params
        params.require(:user).permit(:password, :username)
      end
    end
  end
end
