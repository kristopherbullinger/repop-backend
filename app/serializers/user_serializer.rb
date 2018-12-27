class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :location, :bio, :followers, :following, :purchases, :purchased

  def followers
    self.object.followers.map{|f| {id: f.id, username: f.username}}
  end

  def following
    self.object.following.map{|f| {id: f.id, username: f.username}}
  end

  def purchases
    self.object.purchases.map{|z| z.review ? {id: z.id, item_id: z.item.id, rating: z.review.rating, description: z.review.description, review: true, seller: {username: z.seller.username, id: z.seller.id}, purchase_date: z.created_at} : {id: z.id, item_id: z.item.id, review: false, seller: {username: z.seller.username, id: z.seller.id}, purchase_date: z.created_at}}
  end

  def purchased
    self.object.purchased.map{|z| z.review ? {id: z.id, item_id: z.item.id, rating: z.review.rating, description: z.review.description, review: true, purchaser: {username: z.purchaser.username, id: z.purchaser.id}, purchase_date: z.created_at} : {id: z.id, item_id: z.item.id, review: false, purchase_date: z.created_at}}
  end

end
