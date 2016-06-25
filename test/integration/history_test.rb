require 'test_helper'

class HistoryTest < SatelliteIntegrationTest
  test 'shows history' do
    c1 = 'exit'
    c2 = 'quit'
    c3 = ''
    run_command c1
    run_command c2

    el = find('#command_line')
    el.has_text? c3

    el.send_keys(:down)
    el.has_text? c3

    el.send_keys(:up)
    el.has_text? c2

    el.send_keys(:up)
    el.has_text? c1

    el.send_keys(:up)
    el.has_text? c1

    el.send_keys(:down)
    el.has_text? c2

    el.send_keys(:down)
    el.has_text? c3
  end
end
