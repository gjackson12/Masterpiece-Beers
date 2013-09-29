class CommentsController < ApplicationController

  def create
    @beer_label = BeerLabel.find(params[:beer_label_id])
    @comment = @beer_label.comments.create(comment_params)
    redirect_to beer_label_path(@beer_label)
  end

  def destroy
    @beer_label = BeerLabel.find(params[:beer_label_id])
    @comment = @beer_label.comments.find(params[:id])
    @comment.destroy
    redirect_to beer_label_path(@beer_label)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_comment)
  end
end