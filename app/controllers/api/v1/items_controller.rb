class Api::V1::ItemsController < ApplicationController

  def create
    @item = @user.items.build(item_params).save
  end

  private

  def item_params
    params.require(:item).permit(:description, :price, :size, :brand, images: [])
  end

end
