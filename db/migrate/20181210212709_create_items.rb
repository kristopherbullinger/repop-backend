class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :description
      t.float :price
      t.string :size
      t.string :brand
      t.boolean :sold, default: false

      t.timestamps
    end
  end
end
