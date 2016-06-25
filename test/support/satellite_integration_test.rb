class SatelliteIntegrationTest < ActionDispatch::IntegrationTest
  require "capybara/rails"
  include Capybara::DSL

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  Capybara.current_driver = :selenium

  def admin
    @admin ||= lunar_shell_users(:admin)
  end

  def log_in(u = user, p = 'password')
    run_command "su #{u.username}"
    enter p
  end

  def log_out
    run_command 'exit'
  end

  def run_command(input, el = '.input_field')
    find(el).set "#{input}\n"
  end
  alias_method :enter, :run_command

  def setup
    visit '/'
  end

  def user
    @user ||= lunar_shell_users(:user)
  end
end
