class RemoveCommentIdFromBeerLabels < ActiveRecord::Migration
  def up
    remove_column :beer_labels, :comment_id
  end

  def down
    add_column :beer_labels, :comment_id, :integer
  end
end
