class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize, only: [:create]

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: {user: UserSerializer.new(@user), jwt: @token }, status: :ok
    else
      errors = @user.errors.full_messages
      render json: {errors: errors}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :location, :password, :password_confirmation)
  end
end
