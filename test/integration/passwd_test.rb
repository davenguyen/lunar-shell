require 'test_helper'

class PasswdTest < SatelliteIntegrationTest
  test "no action for guest" do
    run_command 'passwd'
    assert_body 'You must be logged in to change your password.'
  end

  test "changes password" do
    log_in!
    run_command 'passwd'
    assert_body 'Current password'
    assert_body_not 'New password'
    assert_body_not 'Retype new password'

    xhr :patch, "/satellites/passwd/#{user.id}/new"
    assert_body 'New password'
    assert_body_not 'Retype new password'

    xhr :patch, "/satellites/passwd/#{user.id}/confirm"
    assert_body 'Retype new password'

    xhr :patch, "/satellites/passwd/#{user.id}", user: { current_password: 'password', password: 'bob', password_confirmation: 'bob' }
    assert_body 'Password updated.'
  end
end
