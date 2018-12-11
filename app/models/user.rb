class User < ApplicationRecord
  has_many :items

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :likes

  has_many :reviews, class_name: "Review", foreign_key: "seller_id", dependent: :destroy

  has_many :reviewed, class_name: "Review", foreign_key: "purchaser_id", dependent: :destroy

  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true
  has_secure_password

end
