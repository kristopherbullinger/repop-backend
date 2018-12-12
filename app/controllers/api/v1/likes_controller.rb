class Api::V1::LikesController < ApplicationController

  def create
    @user.likes.build(item_id: like_params[:item_id])
  end

  private

  def like_params
    params.require(:like).permit(:item_id)
  end
end
