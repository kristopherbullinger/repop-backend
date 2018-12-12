class Api::V1::RelationshipsController < ApplicationController

  def create
    byebug
    @user.follow(relationship_params[:followed_id])
  end

  private

  def relationship_params
    params.require(:relationship).permit(:followed_id)
  end
end
