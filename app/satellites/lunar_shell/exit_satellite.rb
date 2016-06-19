module LunarShell
  class ExitSatellite < LunarShell::Satellite
    def run!
      user ? logout : no_exit
    end

    private

    def logout
      self.user = nil
    end

    def no_exit
      self.output = "Glitches can't leave their games..."
    end
  end
end
