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
      @delivery_place = DeliveryPlace.new
      @delivery_place.postal_code =  @order.postal_code
      @delivery_place.address =  @order.delivery_address
      @delivery_place.destination =  @order.destination
      @delivery_place.end_user_id =  current_end_user.id
      @delivery_place.save
  	end
    @cart_items = current_end_user.cart_items
  	render 'index'
  end

  def index

  end

# 注文と注文商品の作成
  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @order.save
    # カート内の商品をを注文商品に入れる
    @cart_items = current_end_user.cart_items
     @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      # 商品の特定
      item = Item.find(cart_item.item_id)
      @order_item.order_id = @order.id
      @order_item.item_id = item.id
      @order_item.production_status = "status0"
      @order_item.unit_price = (item.without_tax.to_i * 1.1).round
      @order_item.item_number = cart_item.item_number
      # 注文商品のセーブ
       @order_item.save
     end
     # カート内アイテムの全消去
     cart_items = CartItem.where(params[user_id: current_end_user.id])
     cart_items.each do |cart_item|
     cart_item.destroy
     end
     redirect_to end_users_orders_complete_path
  end

  def complete

  end
  def show
  end

  def show
    @end_user = current_end_user
    @orders = @end_user.orders.reverse_order
    # reverse_order = 降順にする記述
  end

  def history_show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  private

  def order_params
  	# new画面から受け取るパラメーター
  	params.require(:order).permit(:payment_info, :destination, :delivery_address, :postal_code, :postage, :billing_amount, :order_status)
  end
end
