class EndUsers::DeliveriesController < ApplicationController
	
  def index
  	@delivery_places = DeliveryPlace.all
  	@delivery_place = DeliveryPlace.new
  end

  def create
  	delivery_place = DeliveryPlace.new(delivery_place_params)
	# ログインユーザ＝紐付けのIDがあっていれば持っていく、authenticateも必要
	delivery_place.end_user_id = current_end_user.id
	delivery_place.save
	redirect_to end_users_deliveries_path, notice: "配送先が追加されました。"
  end

  def edit
  	# idもってくる
	@delivery_place = DeliveryPlace.find(params[:id])
  end

  def update
  	delivery_place = DeliveryPlace.find(params[:id])
	delivery_place.update(delivery_place_params)
	redirect_to end_users_deliveries_path, notice: "配送先情報が更新されました。"
  end

  def destroy
  	delivery_place = DeliveryPlace.find(params[:id])
  	delivery_place.destroy
  	redirect_to end_users_deliveries_path, notice: "配送先情報が1件削除されました。"
  end

  private
		def delivery_place_params
    	    params.require(:delivery_place).permit(:postal_code, :address, :destination)
    	end

end