require 'test_helper'

class UserFavoritesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: 'dog')
    @category.gifs.create(uid: 'cSUUIDSz9kdKo', url: 'http://media1.giphy.com/media/cSUUIDSz9kdKo/giphy.gif')
    @category.gifs.create(uid: 'rdTbCMvEymAlG', url: 'http://media3.giphy.com/media/rdTbCMvEymAlG/giphy.gif')
  end

  def login_user
    user = User.create(username: "robbie", password: "password", role: 0)
    visit login_path
    fill_in 'Username', with: 'robbie'
    fill_in 'Password', with: 'password'
    click_button 'Login'
  end

  test 'user can favorite a gif' do
    login_user
    visit category_path(@category)
    within '#cSUUIDSz9kdKo' do
      click_link 'Add to favorites'
    end

    assert page.has_content? 'Gif added to favorites'
  end
end
