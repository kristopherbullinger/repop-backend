class Api::V1::ReviewsController < ApplicationController

  def create
    #if the review exists, attempt to update it.
    if Review.find_by(purchase_id: review_params[:purchase_id])
      @review = Review.find_by(purchase_id: review_params[:purchase_id])
      #if update success, return user, else return errors
      if @review.update(review_params)
        render json: {currentUser: UserSerializer.new(@user)}, status: :ok
      else
        render json: {errors: ["There was an error updating this review."]}
      end
    #if review doesnt exist, attempt to create it
    else
      @review = Review.new(review_params)
      if @review.save
        render json: {currentUser: UserSerializer.new(@user)}, status: :ok
      else
        render json: {errors: ["There was an error updating this review."]}
      end
    end
  end

  def destroy
    Review.find_by(purchase_id: review_params[:purchase_id]).destroy
    render json: {currentUser: UserSerializer.new(@user)}, status: :ok
  end



  private

  def review_params
    params.require(:review).permit(:purchase_id, :description, :rating)
  end
end
