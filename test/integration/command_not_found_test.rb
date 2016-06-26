require 'test_helper'

class CommandNotFoundTest < SatelliteIntegrationTest
  test "nothing sent" do
    page.has_no_content? 'Command not found'

    command = 'asdklfj'
    run_command command
    page.has_content? "Command not found: #{command}."
  end
end
