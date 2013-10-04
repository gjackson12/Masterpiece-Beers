class AddStatesToBeerLabels < ActiveRecord::Migration
  def change
    add_column :beer_labels, :state, :string
  end
end
