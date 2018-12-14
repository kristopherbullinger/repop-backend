class Api::V1::RelationshipsController < ApplicationController

  def create
    byebug
    @user.follow(relationship_params[:followed_id])
  end

  def destroy
    @user.unfollow(relationship_params[:followed_id])
  end

  def toggle
    @user.toggleFollow(params[:id])
    render json: {status: "ok"}, status: :ok
  end

  private

  def relationship_params
    params.require(:relationship).permit(:followed_id)
  end
end
