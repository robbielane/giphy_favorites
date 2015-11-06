require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
  test "guest can create account" do
    visit new_user_path
    fill_in 'Username', with: 'robbie'
    fill_in 'Password', with: 'password'
    click_button 'Create Account'

    assert page.has_content? 'Hello, Robbie'
  end
end
