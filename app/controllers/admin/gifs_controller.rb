class Admin::GifsController < Admin::BaseController
  def index
    @gifs = Gif.all
  end

  def new
  end

  def create
    gif_params = Gif.generate_gif(params[:search_term][:category])
    @category = Category.find_or_create_by(name: params[:search_term][:category])
    @gif = @category.gifs.new(gif_params)
    if @gif.save
      flash[:notice] = "Successfully created Gif"
      redirect_to admin_gif_path(@gif)
    else
      flash.now[:error] = @gif.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @gif = Gif.find(params[:id])
  end

end
