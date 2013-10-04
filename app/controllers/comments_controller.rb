class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @beer_label = BeerLabel.find(params[:beer_label_id])
    @beer_label.user = current_user
    @comment = @beer_label.comments.create(comment_params)
    flash[:notice] = "Comment successfully added."
    redirect_to beer_label_path(@beer_label)
  end

  def destroy
    @beer_label = BeerLabel.find(params[:beer_label_id])
    @comment = @beer_label.comments.find(params[:id])
    @comment.destroy
    redirect_to beer_label_path(@beer_label)
  end

  def upvote
    vote(1)
  end

  def downvote
    vote(-1)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_comment)
  end

  def vote(value)
    @beer_label = BeerLabel.find(params[:beer_label_id])
    @comment = @beer_label.comments.
    check_vote
    @comment_vote.like = value
    @comment_vote.user = current_user
    @comment_vote.save
    redirect_to @beer_label
  end

  def check_vote
    if @comment.votes.where(user_id: current_user.id).any?
      @comment_vote = @comment.votes.where(user_id: current_user.id).first
    else
      @comment_vote = @comment.votes.new
    end
  end
end
