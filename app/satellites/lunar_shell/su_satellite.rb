module LunarShell
  class SuSatellite < LunarShell::Satellite
    def run
      return no_username unless args?

      self.user = LunarShell::User.find_by_username(args.first)
      user ? request_password : user_not_found
    end

    private

    def no_username
      { error_message: 'Must provide a username.' }
    end

    def request_password
      {status: :request_password, user_id: user.id }
    end

    def user_not_found
      { error_message: 'User not found.' }
    end
  end
end
