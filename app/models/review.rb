class Review < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :purchaser, class_name: "User"
  belongs_to :item

  validates :rating, presence: true
  validates :purchaser_id, presence: true
  validates :seller_id, presence: true
  validates :item_id, presence: true
end
