class Admins::ItemsController < ApplicationController

  # このコントローラが動作する前に実行、admin側でログイン認証できていなければadmin側のログイン画面へ
  before_action :authenticate_admin!

	def index
		@items = Item.all
	end

	def new
		@item_new = Item.new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to admins_items_path, notice: "successfully created book!"
		else
		  render 'new'
		end
	end

	def show
		@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			redirect_to admins_items_path, notice: "successfully updated book!"
		end
	end

	private

	def item_params
		params.require(:item).permit(:item_name, :item_image, :item_explanation, :category_id, :without_tax, :item_status, :recomend)
	end

end
