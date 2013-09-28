class BeerLabelsController < ActionController::Base
  def index
    @beer_label = BeerLabel.all
  end

  def new
    @beer_label = BeerLabel.new
  end

  def create
    @beer_label = BeerLabel.new(beer_label_params)
    if @beer_label.save
      redirect_to @beer_label
      flash[:notice] = "Beer label successfully added"
    else
      render :new
    end
  end

  def show

  end

  protected
  def beer_label_params
    params.require(:beer_label).permit(:beer_name, :brewery, :origin, :description, :tag, :image)
  end
end