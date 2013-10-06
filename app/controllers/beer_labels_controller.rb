class BeerLabelsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  
  def index
    @beer_labels = BeerLabel.all
  end

  def new
    @beer_label = BeerLabel.new
  end

  def create
    @beer_label = BeerLabel.new(beer_label_params)
    @beer_label.user = current_user
    if @beer_label.save
      redirect_to @beer_label
      flash[:notice] = "Beer label successfully added"
    else
      render :new
    end
  end

  def show
    @beer_label = BeerLabel.find_by_url(params[:id])
    @vote = Vote.new
  end

  def destroy
    @beer_label = BeerLabel.find_by_url(params[:id])
    @beer_label.destroy

    redirect_to beer_labels_path
  end

  def upvote
    vote(1)
  end

  def downvote
    vote(-1)
  end

  protected
  def beer_label_params
    params.require(:beer_label).permit(:beer_name, :brewery, :origin, :description, :tag, :image, :comment)
  end

  def vote(value)
    @beer_label = BeerLabel.find_by_url(params[:id])
    check_vote
    @beer_label_vote.like = value
    @beer_label_vote.user = current_user
    @beer_label_vote.save
    check_beer_label_score
    redirect_to @beer_label
  end

  def check_beer_label_score
    if Vote.score(@beer_label) == 5
      @beer_label.approve
    elsif Vote.score(@beer_label) == -5
      @beer_label.reject
    end
  end

  def check_vote
    if @beer_label.votes.where(user_id: current_user.id).any?
      @beer_label_vote = @beer_label.votes.where(user_id: current_user.id).first
    else
      @beer_label_vote = @beer_label.votes.new
    end
  end

end
