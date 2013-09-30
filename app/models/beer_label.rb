class BeerLabel < ActiveRecord::Base

  has_many :comments,
    inverse_of: :beer_label,
    dependent: :destroy

  accepts_nested_attributes_for :comments, allow_destroy: true

  belongs_to :user,
    inverse_of: :beer_labels
  has_many :votes,
    as: :votable,
    inverse_of: :beer_label

  validates_presence_of :beer_name
  validates_presence_of :brewery
  validates_presence_of :origin

  validates_format_of :origin, with: /\A[a-zA-Z]+\z/

  mount_uploader :image, ImageUploader
end
