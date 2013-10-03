class Vote < ActiveRecord::Base

  validates_presence_of :voteable_type
  validates_presence_of :voteable_id
  validates_presence_of :user_id

  belongs_to :voteable, polymorphic: true
end
