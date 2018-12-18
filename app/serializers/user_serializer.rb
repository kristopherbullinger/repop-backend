class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :location, :bio, :followers, :following

  # has_many :followers, embed: :id
  # has_many :following, embed: :id

  # has_many :items
  # has_many :likes
  # has_many :follower, embed: :ids
  # has_many :following, embed: :ids
  #
  # class LikeSerializer < ActiveModel::Serializer
  #   attributes :item
  # end
  def followers
    self.object.followers.map{|f| {id: f.id, username: f.username}}
  end
  #
  def following
    self.object.following.map{|f| {id: f.id, username: f.username}}
  end
  #
  # class UserSerializer < ActiveModel::Serializer
  #   attributes :id, :username
  # end

  # class UserSerializer < ActiveModel::Serializer
  #   attributes :id, :username, :email, :location
  # end
end
