class CreateBeerLabels < ActiveRecord::Migration
  def change
    create_table :beer_labels do |t|
      t.string :beer_name, null: false
      t.string :brewery, null: false
      t.string :origin, null: false
      t.text :description
      t.string :tag

      t.timestamps
    end
  end
end
