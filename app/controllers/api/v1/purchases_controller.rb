class PurchasesController < ApplicationController

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.purchaser = @user
    @purchase.save
    Item.find(purchase_params[:item_id]).update(sold: true)
  end

  private
  def purchase_params
    params.require(:purchase).permit(:item_id, :seller_id)
  end
end
