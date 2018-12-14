class Api::V1::LikesController < ApplicationController

  def create
    @user.likes.build(item_id: like_params[:item_id])
  end

  def toggle
    @like = Like.find_by(user_id: @user.id, item_id: params[:id])
    @user.toggleLikeItem(params[:id])
    render status: :ok
  end

  private

  def like_params
    params.require(:like).permit(:item_id)
  end
end
