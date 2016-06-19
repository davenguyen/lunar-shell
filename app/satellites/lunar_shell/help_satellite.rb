module LunarShell
  class HelpSatellite < LunarShell::Satellite
    def run!
      self.view_partial = 'commands'
    end

    def commands
      self.class.superclass.all.sort
    end
  end
end
