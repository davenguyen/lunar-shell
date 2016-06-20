require 'test_helper'

class SuTest < SatelliteIntegrationTest
  test "log in" do
    assert_body_not user.username
    log_in!
    assert_body user.username
  end

  test "can substitue user" do
    assert_body_not user.username
    assert_body_not admin.username

    log_in!
    assert_body user.username
    assert_body_not admin.username

    log_in!(admin)
    assert_body admin.username
  end
end
