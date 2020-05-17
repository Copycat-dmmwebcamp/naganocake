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
	redirect_to end_users_deliveries_path, notice: "successfully created delivery_place!"
  end

  def edit
  	# idもってくる
	@delivery_place = DeliveryPlace.find(params[:id])
  end

  def update
  	delivery_place = DeliveryPlace.find(params[:id])
	delivery_place.update(delivery_place_params)
	redirect_to end_users_deliveries_path, notice: "successfully updated delivery_place!"
  end

  def destroy
  	delivery_place = DeliveryPlace.find(params[:id])
  	delivery_place.destroy
  	redirect_to end_users_deliveries_path, notice: "deleted delivery_place."
  end

  private
		def delivery_place_params
    	    params.require(:delivery_place).permit(:postal_code, :address, :destination)
    	end

end