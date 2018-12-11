class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :location, :followers, :following
  has_many :items
  has_many :likes
  class ItemSerializer < ActiveModel::Serializer
    attributes :description, :price, :size, :brand, :sold, :created_at
  end
  class LikeSerializer < ActiveModel::Serializer
    attributes :item
  end
end
