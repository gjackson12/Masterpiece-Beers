class Comment < ActiveRecord::Base
  belongs_to :beer_label,
    inverse_of: :comments

  validates_presence_of :user_comment

end
