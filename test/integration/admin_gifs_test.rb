require 'test_helper'

class AdminGifsTest < ActionDispatch::IntegrationTest
  test 'admin can create a new gif' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit new_admin_gif_path
    fill_in 'Gif Search Term', with: 'dog'
    click_button 'Create Gif'

    assert page.has_css? '#gif'
  end
end
