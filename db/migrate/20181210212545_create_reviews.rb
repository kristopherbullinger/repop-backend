class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :purchase_id
      t.string :description
      t.timestamps
    end
  end
end
