module LunarShell
  class QuitSatellite < LunarShell::Satellite
    def run
      user ? logout : no_exit
    end

    private

    def logout
      { status: :logout }
    end

    def no_exit
      { message: 'Never give up! Never surrender!' }
    end
  end
end
