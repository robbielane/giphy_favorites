require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  def create_gifs
    @category = Category.create(name: 'dog')
    @category.gifs.create(uid: 'cSUUIDSz9kdKo', url: 'http://media1.giphy.com/media/cSUUIDSz9kdKo/giphy.gif')
    @category.gifs.create(uid: 'rdTbCMvEymAlG', url: 'http://media3.giphy.com/media/rdTbCMvEymAlG/giphy.gif')
  end

  test 'logged in admin sees gifs index' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path

    assert page.has_content?("Categories")
  end

  test 'admin can view gifs from category' do
    create_gifs
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_category_path(@category)

    assert page.has_content? "Gifs for '#{@category.name}'"
    assert page.has_css? '#cSUUIDSz9kdKo'
    assert page.has_css? '#rdTbCMvEymAlG'
  end
end
