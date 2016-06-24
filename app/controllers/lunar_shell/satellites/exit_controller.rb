module LunarShell
  module Satellites
    class ExitController < LunarShell::SatellitesController
      def run
        if current_user
          log_out!
        else
          @message = "Glitches can't leave their games..."
        end
      end
    end
  end
end
