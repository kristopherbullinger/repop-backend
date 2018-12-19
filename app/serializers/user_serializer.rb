class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :location, :bio, :followers, :following

  def followers
    self.object.followers.map{|f| {id: f.id, username: f.username}}
  end
  #
  def following
    self.object.following.map{|f| {id: f.id, username: f.username}}
  end

end
