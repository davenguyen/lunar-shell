require 'test_helper'

class ExitTest < SatelliteIntegrationTest
  test "not logged in response" do
    run_command 'exit'
    assert response.body.include?('Glitches')
  end

  test "logged in response" do
    log_in!
    run_command 'exit'
    assert_not response.body.include?('Glitches')
  end
end
