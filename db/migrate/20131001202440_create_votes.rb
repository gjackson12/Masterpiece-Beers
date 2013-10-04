class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :like
      t.integer :voteable_id
      t.string :voteable_type
      t.integer :user_id

      t.timestamps
    end

    add_index :votes, [:voteable_id, :voteable_type, :user_id], unique: true

  end
end
