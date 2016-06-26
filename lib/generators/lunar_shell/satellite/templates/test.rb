require 'test_helper'

class <%= class_name %>Test < SatelliteIntegrationTest
  test "<%= singular_name %>" do
    run_command '<%= singular_name %>'
    page.has_content? 'Just ran "<%= singular_name %>"!'
  end
end
