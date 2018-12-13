class ItemSerializer < ActiveModel::Serializer
  attributes :id, :price, :description, :created_at, :size, :brand
  belongs_to :user
  has_many :likes
  class UserSerializer < ActiveModel::Serializer
    attributes :username, :id
  end
  class LikeSerializer < ActiveModel::Serializer
    attributes :id
  end
end
