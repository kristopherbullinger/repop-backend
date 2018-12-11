class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
    add_index :likes, [:item_id, :user_id], unique: true
  end
end
