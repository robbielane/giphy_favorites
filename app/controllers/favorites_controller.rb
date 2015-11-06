class FavoritesController < ApplicationController
  before_action :set_user

  def index
    @favorites = @user.gifs
  end

  def create
    gif = Gif.find_by(uid: params[:uid])
    Favorite.create(user_id: @user.id, gif_id: gif.id)
    flash[:notice] = "Gif added to favorites"
    redirect_to favorites_path
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end
end
