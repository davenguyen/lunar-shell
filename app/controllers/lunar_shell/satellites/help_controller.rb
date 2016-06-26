module LunarShell
  module Satellites
    class HelpController < LunarShell::SatellitesController
      PUBLIC = false

      def run
        @message = 'Never give up! Never surrender!'
      end

      private

      def commands
        @commands ||= self.class.superclass.subclasses.
          select { |sat| sat::PUBLIC }.
          map { |sat| sat.name.split('::').last.underscore[0..-12] }.
          sort
      end
      helper_method :commands
    end
  end
end
