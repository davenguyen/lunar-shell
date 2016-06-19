module LunarShell
  class SuSatellite < LunarShell::Satellite
    def run!
      return no_username_error unless args?

      self.user = LunarShell::User.find_by_username(args.first)
      user ? request_password : user_not_found_error
    end

    private

    def no_username_error
      self.output = 'Must provide a username.'
    end

    def request_password
      self.view_template = 'request_password'
      {status: :request_password, user_id: user.id }
    end

    def user_not_found_error
      self.output = 'User not found.'
    end
  end
end
