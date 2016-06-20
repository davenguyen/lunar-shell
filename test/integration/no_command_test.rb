require 'test_helper'

class NoCommandTest < SatelliteIntegrationTest
  test "nothing sent" do
    run_command ''
    assert_response :success
    assert_body_not 'output'
  end
end
