require 'test_helper'

class QuitTest < SatelliteIntegrationTest
  test "not logged in" do
    run_command 'quit'
    page.has_content? 'Never give up!'
  end

  test "logged in" do
    log_in
    run_command 'quit'
    page.has_content? 'Never give up!'
  end
end
