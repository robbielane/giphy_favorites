class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    @gifs = @category.gifs
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
