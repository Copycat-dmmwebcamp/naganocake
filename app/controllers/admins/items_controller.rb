class Admins::ItemsController < ApplicationController

  # このコントローラが動作する前に実行、admin側でログイン認証できていなければadmin側のログイン画面へ
  before_action :authenticate_admin!

	def index
		@items = Item.all
		@items = Item.page(params[:page]).per(10)
	end

	def new
		@item_new = Item.new
	end

	def create
		@item_new = Item.new(item_params)
		if @item_new.save
			redirect_to  admins_item_path(@item_new.id), notice: "商品を作成しました!"
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
			redirect_to admins_items_path, notice: "商品を編集しました"
		else
			render 'edit'
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to admins_items_path, notice: "商品を削除しました"
	end

	private

	def item_params
		params.require(:item).permit(:item_name, :item_image, :item_explanation, :category_id, :without_tax, :item_status, :recomend)
	end

end
