require 'test_helper'

class SuTest < SatelliteIntegrationTest
  test "log in" do
    assert_not response.body.include?(user.username)
    log_in!
    assert response.body.include?(user.username)
  end

  test "can substitue user" do
    assert_not response.body.include?(user.username)
    assert_not response.body.include?(admin.username)

    log_in!
    assert response.body.include?(user.username)
    assert_not response.body.include?(admin.username)

    log_in!(admin)
    assert response.body.include?(admin.username)
  end
end
