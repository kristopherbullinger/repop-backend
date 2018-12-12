class Purchase < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :purchaser, class_name: "User"
  belongs_to :item
  has_one :review
end
