class RemoveCommentIdFromBeerLabels < ActiveRecord::Migration
  def change
    remove_column :beer_labels, :comment_id
  end
end
