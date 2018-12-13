class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize, only: [:create, :show]

  def show
    get_user
    render json: {selectedUser: UserSerializer.new(@show_user), items: @show_user.items.map{|item| ItemSerializer.new(item)}}, status: :ok
  end

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

  def get_user
    @show_user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :location, :password, :password_confirmation)
  end
end
