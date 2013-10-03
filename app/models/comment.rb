class Comment < ActiveRecord::Base
  belongs_to :beer_label,
    inverse_of: :comments

  belongs_to :user

  has_many :votes, as: :voteable

  validates_presence_of :user_comment

end
