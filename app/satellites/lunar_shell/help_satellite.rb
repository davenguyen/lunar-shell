module LunarShell
  class HelpSatellite < LunarShell::Satellite
    def run
      satellites
    end

    private

    def satellites
      self.class.superclass.all.sort
    end
  end
end
