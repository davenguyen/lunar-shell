require 'test_helper'

class QuitTest < SatelliteIntegrationTest
  test "not logged in response" do
    run_command 'quit'
    assert_body 'Never give up!'
  end

  test "log out" do
    log_in!
    run_command 'quit'
    assert_body_not 'Never give up!'
  end
end
