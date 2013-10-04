class VotesController < ApplicationController

  def create
    voteable
    @vote = @voteable.votes.new(vote_params)
    @vote.user = current_user

    if @vote.save
      redirect_to polymorphic_path(@voteable)
    else
      redirect_to polymorphic_path(@voteable)
    end 
  end

  protected

  def vote_params
    params.require(:vote).permit(
      :like,
      :voteable_id,
      :voteable_type,
      :user_id
      )
  end

  def voteable
    klass = [BeerLabel, Comment].detect {|v| params["#{v.name.underscore}_id"]}
    @voteable = klass.find(params["#{klass.name.underscore}_id"]) 
  end

end