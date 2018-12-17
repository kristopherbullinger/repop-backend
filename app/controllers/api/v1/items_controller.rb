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
    @item = @user.items.build(item_params)
    if @item.save
      render json: {item: ItemSerializer.new(@item)}, status: :ok
    else
      render json: {errors: @item.errors.full_messages}, status: 422
    end
  end

  def destroy
    @item = Item.find(params[:id]).destroy
  end

  private

  def item_params
    params.require(:item).permit(:description, :price, :size, :brand, :image)
  end

end
