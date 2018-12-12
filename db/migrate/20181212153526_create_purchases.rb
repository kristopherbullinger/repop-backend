class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :item_id
      t.integer :purchaser_id
      t.integer :seller_id
      t.timestamps
    end
  end
end
