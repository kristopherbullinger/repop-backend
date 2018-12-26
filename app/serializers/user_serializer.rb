class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :location, :bio, :followers, :following, :purchases, :purchased

  def followers
    self.object.followers.map{|f| {id: f.id, username: f.username}}
  end

  def following
    self.object.following.map{|f| {id: f.id, username: f.username}}
  end

  def purchases
    self.object.purchases.map{|z| z.review ? {id: z.id, item_id: z.item.id, rating: z.review.rating, description: z.review.description, review: true} : {id: z.id, item_id: z.item.id, review: false}}
  end

  def purchased
    self.object.purchased.map{|z| z.review ? {id: z.id, item_id: z.item.id, rating: z.review.rating, description: z.review.description, review: true} : {id: z.id, item_id: z.item.id, review: false}}
  end

end
