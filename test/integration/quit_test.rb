require 'test_helper'

class QuitTest < SatelliteIntegrationTest
  test "not logged in response" do
    run_command 'quit'
    assert response.body.include?('Never give up!')
  end

  test "logged in response" do
    log_in!
    run_command 'quit'
    assert_not response.body.include?('Never give up!')
  end
end
