module LunarShell
  class User < ActiveRecord::Base
    attr_accessor :current_password

    has_secure_password
  end
end
