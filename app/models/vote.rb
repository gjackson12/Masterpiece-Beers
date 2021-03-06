class Vote < ActiveRecord::Base

  validates_presence_of :voteable_type
  validates_presence_of :voteable_id
  validates_presence_of :user_id

  validates_uniqueness_of :user_id, {scope: [:voteable_type, :voteable_id]} 

  belongs_to :voteable, polymorphic: true

  belongs_to :user

  def self.score(voteable_type)
    @total_votes = where(voteable_id: voteable_type.id, voteable_type: voteable_type.class ).pluck(:like)
    @total_votes.any? ? @total_votes.inject { |total,vote| total + vote } : 0
  end
end
