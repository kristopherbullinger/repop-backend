class Api::V1::ItemsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]

  def index
    render json: {items: Item.all.map{|item| ItemSerializer.new(item)} }, status: :ok
  end

  def show
    @item = Item.find(params[:id])
    render json: {item: ItemSerializer.new(@item)}, status: :ok
  end

  def create
    byebug
    @item = @user.items.build(item_params).save
  end

  private

  def item_params
    params.permit(:description, :price, :size, :brand, :image)
  end

end
