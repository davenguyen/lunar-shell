require 'test_helper'

class ExitTest < ActionDispatch::IntegrationTest
  test "not logged in response" do
    get '/'
    xhr :post, '/interpreter', command_line: 'exit'
    assert response.body.include?('Glitches')
  end

  test "logged in response" do
    get '/'
    assert_not response.body.include?('dave')

    id = lunar_shell_users(:user).id
    xhr :post, '/interpreter', command_line: 'su dave'
    xhr :patch, "/satellites/su/#{id}", user: { password: 'password' }
    assert response.body.include?('dave')

    xhr :post, '/interpreter', command_line: 'exit', format: 'js'
    assert_not response.body.include?('Glitches')
  end
end
