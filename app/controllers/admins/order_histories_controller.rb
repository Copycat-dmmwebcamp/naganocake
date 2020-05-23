class Admins::OrderHistoriesController < ApplicationController

  # このコントローラが動作する前に実行、admin側でログイン認証できていなければadmin側のログイン画面へ
  before_action :authenticate_admin!

  def index
  	@orders = Order.all.reverse_order
    @orders = Order.page(params[:page]).per(10)
  end

  def user_order
    @end_user = EndUser.find(params[:id])
    @orders = Order.where(end_user_id: @end_user.id).reverse_order.page(params[:page]).per(10)
    render 'index'
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    @order.update(order_params)
    if @order.order_status == 'stage1'
       @order_items.each do |order_item|
        order_item.production_status = 1
        order_item.save
       end
    end
    #redirect_to admins_order_history_path(@order.id)
  end

  def update_product
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    @order_item_new = OrderItem.new(order_item_params)
    @order_item = OrderItem.find_by(order_id: params[:id], item_id: @order_item_new.item_id)
    @order_item.update(order_item_params)
        if @order_item.production_status == 'status2'
           @order.order_status = 2
           @order.save
        end
    if @order_item.production_status == 'status3'
       count = 0
       @order_items.each do |order_item|
        if order_item.production_status == 'status3'
           count = count + 1
        end
       end
       if @order_items.count == count
          @order.order_status = 3
          @order.save
       end
    end
    #redirect_to admins_order_history_path(@order.id)
  end

  private
  def order_params
     params.require(:order).permit(:order_status)
  end

  def order_item_params
     params.require(:order_item).permit(:production_status, :item_id)
  end
end
