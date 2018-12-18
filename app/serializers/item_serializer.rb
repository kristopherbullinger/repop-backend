class ItemSerializer < ActiveModel::Serializer
  attributes :id, :price, :description, :created_at, :size, :brand, :sold, :user_id
  belongs_to :user
  has_many :likes

  class UserSerializer < ActiveModel::Serializer
    attributes :username, :id, :location
  end
  class LikeSerializer < ActiveModel::Serializer
    attributes :user_id
  end
  #
  # def image_url
  #   instance_options[:get_image_url].call(object.image)
  # end
end
