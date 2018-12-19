class ItemSerializer < ActiveModel::Serializer
  attributes :id, :price, :description, :created_at, :size, :brand, :user_id
  belongs_to :user
  has_many :likes
  has_one :purchase

  class UserSerializer < ActiveModel::Serializer
    attributes :username, :id, :location
  end
  class LikeSerializer < ActiveModel::Serializer
    attributes :user_id
  end
  class PurchaseSerializer < ActiveModel::Serializer
    attributes :id, :seller_id, :purchaser_id
  end
end
