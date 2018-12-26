class Api::V1::PurchasesController < ApplicationController

  def create
    @item = Item.find(purchase_params[:item_id])
    if !!@item.purchase
      render json: {errors: ["This item is not for sale"]}, status: 422
    else
      @purchase = Purchase.new(purchase_params)
      @purchase.purchaser = @user
      @purchase.save
      @item = Item.find(purchase_params[:item_id])
      render json: {item: ItemSerializer.new(@item)}, status: :ok
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:item_id, :seller_id)
  end
end
