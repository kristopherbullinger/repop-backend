class User < ApplicationRecord
  has_one_attached :image
  has_many :items

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :likes

  has_many :purchases, class_name: "Purchase", foreign_key: "purchaser_id", dependent: :destroy
  has_many :purchased, class_name: "Purchase", foreign_key: "seller_id", dependent: :destroy

  has_many :reviews, through: :purchases, source: :review, dependent: :destroy
  has_many :reviewed, through: :purchased, source: :review, dependent: :destroy
  #
  # has_many :reviews, through: :purchases, dependent: :destroy
  # has_many :reviewed, through: :purchased, dependent: :destroy


  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true
  has_secure_password

  def follow(id)
    self.active_relationships.build(followed_id: id).save
  end

  def unfollow(id)
    self.active_relationships.find_by(followed_id: id).destroy
  end

  def toggleFollow(id)
    if self.following.include?(User.find(id))
      self.unfollow(id)
    else
      self.follow(id)
    end
  end

  def likeItem(id)
    Like.create(user_id: self.id, item_id: id)
  end

  def unlikeItem(id)
    Like.find_by(item_id: id, user_id: self.id).destroy
  end

  def toggleLikeItem(id)
    @item = Item.find(id)
    if !!@item.likes.find{|l| l.user_id == self.id}
      self.unlikeItem(id)
    else
      self.likeItem(id)
    end
  end

end
