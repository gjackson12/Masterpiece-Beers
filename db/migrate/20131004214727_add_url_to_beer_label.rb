class AddUrlToBeerLabel < ActiveRecord::Migration
  def change
    add_column :beer_labels, :url, :string
  end
end
