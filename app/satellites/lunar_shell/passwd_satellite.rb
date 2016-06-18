module LunarShell
  class PasswdSatellite < LunarShell::Satellite
    def run
      user ? request_current_password : no_user_error
    end

    private

    def no_user_error
      { error_message: 'You must be logged in to change your password.' }
    end

    def request_current_password
      { status: :request_current_password }
    end
  end
end
