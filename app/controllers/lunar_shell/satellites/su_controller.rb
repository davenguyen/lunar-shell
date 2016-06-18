module LunarShell
  module Satellites
    class SuController < LunarShell::SatellitesController
      def update
        unless current_user.authenticate(su_params[:password])
          clear_current_user!
          @error_message = 'Wrong password.'
        end
      end

      private

      def su_params
        params.require(:user).permit(:password)
      end
    end
  end
end
