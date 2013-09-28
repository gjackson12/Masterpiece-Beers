class AddImageToBeerLabels < ActiveRecord::Migration
  def change
    add_column :beer_labels, :image, :string
  end
end
