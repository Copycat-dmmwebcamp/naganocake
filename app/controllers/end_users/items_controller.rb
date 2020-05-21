class EndUsers::ItemsController < ApplicationController

  def top
  	# おすすめ商品かつ販売中のもの
  	@items = Item.where(recomend: true, item_status: 0)
  	@categories = Category.all

  end

  def index
  	@items = Item.all
  	@categories = Category.all
  	@id = 0
    @items = Item.page(params[:page])
  end

  def show
  	@item = Item.find(params[:id])
  	@categories = Category.all

    @cart_item = CartItem.new(item_id: @item.id)
  end

  def search
  	@categories = Category.all
  	@id = params[:category_id]
  	@category = Category.find(@id)
  	# カテゴリーと一致する商品を探す
  	@items = Item.where(category_id: @id)
  	render 'index'

  end

end
