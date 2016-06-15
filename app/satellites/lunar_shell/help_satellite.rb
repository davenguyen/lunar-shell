module LunarShell
  class HelpSatellite < LunarShell::Satellite
    def run
      "Try these commands:<br>&nbsp;&nbsp;&nbsp;#{satellites}"
    end

    private

    def satellites
      self.class.superclass.all.join('&nbsp;&nbsp;&nbsp;')
    end
  end
end
