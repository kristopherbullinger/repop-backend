class Review < ApplicationRecord
  belongs_to :purchase

  validates :rating, presence: true
  validates :purchase_id, presence: true
end
