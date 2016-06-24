module LunarShell
  module Satellites
    class SuController < LunarShell::SatellitesController
      def run
        render 'no_username' and return unless provided_username
      end

      def create

        if !log_in!(su_params[:username]).
            try(:authenticate, su_params[:password])
          log_out!
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
