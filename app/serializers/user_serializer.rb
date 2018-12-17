class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :location, :followers, :following
  # has_many :items
  # has_many :likes
  # has_many :follower, embed: :ids
  # has_many :following, embed: :ids
  #
  # class LikeSerializer < ActiveModel::Serializer
  #   attributes :item
  # end
  def followers
    object.followers.map{|f| FollowerSerializer.new(f)}
  end
  def following
    object.following.map{|f| FollowerSerializer.new(f)}
  end
  class FollowerSerializer < ActiveModel::Serializer
    attributes :id
  end
  #
  # def image_url
  #   instance_options[:get_image_url].call(object.image)
  # end
  # class UserSerializer < ActiveModel::Serializer
  #   attributes :id, :username, :email, :location
  # end
end
