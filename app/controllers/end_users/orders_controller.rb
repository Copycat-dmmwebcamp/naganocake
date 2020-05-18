class EndUsers::OrdersController < ApplicationController

  def new
  	@order = Order.new(payment_info: 'credit')
  	@end_user  = EndUser.find(current_end_user.id)
  	@delivery_places = DeliveryPlace.where(end_user_id: @end_user.id)
  end

  def confirm
  	@order = Order.new(order_params)
  	if @order.postage == 0
  		# ログインユーザーの住所を選択
  		@end_user  = EndUser.find(current_end_user.id)
  		@order.postal_code =  @end_user.postal_code 
  		@order.delivery_address =   @end_user.address 
  		@order.destination =  @end_user.full_name_kanji

  	elsif  @order.postage == 1
  		# 登録済みの住所を選択
  		id = @order.billing_amount
  		@delivery_place = DeliveryPlace.find(id)
  		@order.postal_code =  @delivery_place.postal_code
  		@order.delivery_address =  @delivery_place.address
  		@order.destination =  @delivery_place.destination

  	else
  		# 新たに入力した住所を選択
  	end
  	render 'index'
  end

  def index
  	@order = Order.new
  end

  private

  def order_params
  	# new画面から受け取るパラメーター
  	params.require(:order).permit(:payment_info, :destination, :delivery_address, :postal_code, :postage, :billing_amount)
  end
end
