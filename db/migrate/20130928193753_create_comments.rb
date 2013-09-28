class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :user_comment, null: false
      t.references :beer_label

      t.timestamps
    end

      add_index :comments, :beer_label_id
  end
end
