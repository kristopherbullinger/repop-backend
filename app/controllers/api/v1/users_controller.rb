class Api::V1::UsersController < ApplicationController

  def create
    byebug
    @user = User.create(user_params)
    if @user.valid?
      render json: {user: UserSerializer.new(@user) }, status: :ok
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :location, :password, :password_confirmation)
  end
end
