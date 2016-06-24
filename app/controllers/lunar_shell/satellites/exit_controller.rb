module LunarShell
  module Satellites
    class ExitController < LunarShell::SatellitesController
      def run
        if current_user
          clear_current_user!
        else
          @message = "Glitches can't leave their games..."
        end
      end
    end
  end
end
