module LunarShell
  module Satellites
    class QuitController < LunarShell::SatellitesController
      def run
        @message = 'Never give up! Never surrender!'
      end
    end
  end
end
