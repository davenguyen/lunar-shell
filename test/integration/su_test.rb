require 'test_helper'

class SuTest < SatelliteIntegrationTest
  test "log in" do
    page.has_no_content? user.username
    log_in
    page.has_content? user.username
  end

  test "can substitue user" do
    page.has_no_content? user.username
    page.has_no_content? admin.username

    log_in
    page.has_content? user.username
    page.has_no_content? admin.username

    log_in(admin)
    page.has_content? user.username
    page.has_content? admin.username
  end
end
