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

  def destroy
    @favorite = Favorite.find_by(user_id: session[:user_id], gif_id: params[:id])
    @favorite.destroy
    flash.now[:notice] = "Successfully removed favorite"
    render :index
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end
end
