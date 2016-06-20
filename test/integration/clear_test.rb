require 'test_helper'

class ClearTest < SatelliteIntegrationTest
  test "clears history" do
    run_command 'exit'
    assert_body 'Glitches'

    run_command 'clear'
    assert_body_not 'Glitches'
  end
end
