class Api::V1::RelationshipsController < ApplicationController

  def create
    byebug
    @user.follow(relationship_params[:followed_id])
  end

  def destroy
    @user.unfollow(relationship_params[:followed_id])
  end

  def toggle
    byebug
    @user.toggleFollow(params[:id])
  end

  private

  def relationship_params
    params.require(:relationship).permit(:followed_id)
  end
end
