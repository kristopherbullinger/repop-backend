class Api::V1::ItemsController < ApplicationController

  def create
    byebug
    @item = Item.create(item_params)
    byebug
  end

  private
  def item_params
    params.require(:item).permit(:description, :price, :size, :brand, images: [])
  end
end
