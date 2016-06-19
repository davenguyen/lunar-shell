module LunarShell
  class PasswdSatellite < LunarShell::Satellite
    def run!
      user ? request_current_password : no_user_error
    end

    private

    def no_user_error
      self.output = 'You must be logged in to change your password.'
    end

    def request_current_password
      self.view_template = 'request_current_password'
    end
  end
end
