class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :purchaser_id
      t.integer :seller_id
      t.integer :item_id
      t.string :description

      t.timestamps
    end
  end
end
