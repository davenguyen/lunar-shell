require 'test_helper'

class NoCommandTest < SatelliteIntegrationTest
  test "nothing sent" do
    page.has_no_content? '> >'

    run_command ''
    page.has_content? '> >'
  end
end
