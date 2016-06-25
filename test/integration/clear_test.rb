require 'test_helper'

class ClearTest < SatelliteIntegrationTest
  test 'clears history' do
    page.has_content? 'Welcome to Lunar shell!'

    run_command 'clear'
    page.has_no_content? 'Welcome to Lunar shell!'
  end
end
