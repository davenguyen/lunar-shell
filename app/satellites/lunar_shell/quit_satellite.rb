module LunarShell
  class QuitSatellite < LunarShell::Satellite
    def run!
      user ? logout : no_quit
    end

    private

    def logout
      self.user = nil
    end

    def no_quit
      self.output = 'Never give up! Never surrender!'
    end
  end
end
