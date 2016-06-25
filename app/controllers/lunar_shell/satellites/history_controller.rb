module LunarShell
  module Satellites
    class HistoryController < LunarShell::SatellitesController
      PUBLIC = false

      def run
        @command = up? ? up_value(i-1) : down_value(i+1)
      end

      private

      def direction
        parameters.first
      end

      def down?
        !up?
      end

      def down_value(j)
        return if j > history.count
        session[:history_index] = j
        history[j]
      end

      def i
        session[:history_index]
      end

      def up?
        direction == 'up'
      end

      def up_value(j)
        return history[i] if j < 0
        session[:history_index] = j
        history[j]
      end
    end
  end
end
