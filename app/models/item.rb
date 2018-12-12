class Item < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one :purchase
  has_one :review, through: :purchase
  validates :description, presence: true
  validates :price, presence: true
  validates :size, presence: true
end
