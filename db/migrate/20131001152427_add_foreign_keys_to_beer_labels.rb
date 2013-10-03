class AddForeignKeysToBeerLabels < ActiveRecord::Migration
  def change
    add_column :beer_labels, :user_id, :integer, null:false
    add_column :beer_labels, :comment_id, :integer
  end
end
