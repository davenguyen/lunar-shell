require 'test_helper'

class PasswdTest < SatelliteIntegrationTest
  test "not logged in" do
    run_command 'passwd'
    page.has_content? 'You must be logged in to change your password.'
  end

  test "logged in" do
    log_in
    run_command 'passwd'
    enter 'password'
    enter 'pass'
    enter 'pass'
    page.has_content? 'Password updated.'
  end
end
