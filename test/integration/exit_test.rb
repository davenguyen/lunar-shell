require 'test_helper'

class ExitTest < SatelliteIntegrationTest
  test "not logged in response" do
    run_command 'exit'
    assert_body 'Glitches'
  end

  test "log out" do
    log_in!
    run_command 'exit'
    assert_body_not 'Glitches'
  end
end
