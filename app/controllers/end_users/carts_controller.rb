class EndUsers::CartsController < ApplicationController
  def index
  	@cart_items = current_end_user.cart_items
  	
  end

  def create
  	cart_item = CartItem.new(cart_item_params)
    cart_item.end_user_id = current_end_user.id
    cart_item.save
    redirect_to end_users_carts_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to end_users_carts_path
  end

  def destroy
  	cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to end_users_carts_path , notice: "商品情報を削除しました。"
  end

  def destroy_all
    cart_items = CartItem.where(params[user_id: current_end_user.id])
    cart_items.each do |cart_item|
  	cart_item.destroy
    end
    redirect_to end_users_carts_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:end_user_id, :item_id, :item_number)
  end

end
