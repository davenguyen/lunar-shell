module LunarShell
  class ExitSatellite < LunarShell::Satellite
    def run
      user ? logout : no_exit
    end

    private

    def logout
      { status: :logout }
    end

    def no_exit
      { message: "Glitches can't leave their games..." }
    end
  end
end
