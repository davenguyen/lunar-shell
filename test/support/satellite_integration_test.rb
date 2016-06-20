class SatelliteIntegrationTest < ActionDispatch::IntegrationTest
  def admin
    @admin ||= lunar_shell_users(:admin)
  end

  def log_in!(u = user)
    run_command "su #{u.username}"
    xhr :patch, "/satellites/su/#{u.id}", user: { password: 'password' }
  end

  def run_command(input)
    xhr :post, '/interpreter', command_line: input
  end

  def setup
    get '/'
  end

  def user
    @user ||= lunar_shell_users(:user)
  end
end
