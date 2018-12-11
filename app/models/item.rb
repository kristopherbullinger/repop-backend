class Item < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one :review
  validates :description, presence: true
  validates :price, presence: true
  validates :size, presence: true
end
