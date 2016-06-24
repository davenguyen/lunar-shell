module LunarShell
  module Satellites
    class HelpController < LunarShell::SatellitesController
      def run
        @message = 'Never give up! Never surrender!'
      end

      private

      def commands
        @commands ||= LunarShell::Engine.routes.routes.inject([]) do |a, r|
          c = r.defaults[:controller].clone
          if c.include?('satellites/')
            c.gsub!('lunar_shell/satellites/', '')
            a << c unless c == 'satellites'
          end
          a.uniq
        end
      end
      helper_method :commands
    end
  end
end
