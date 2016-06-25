require 'test_helper'

class ExitTest < SatelliteIntegrationTest
  test "not logged in" do
    run_command 'exit'
    page.has_content? 'Glitches'
  end

  test "logged in" do
    log_in
    run_command 'exit'
    page.has_no_content? 'Glitches'
  end
end
