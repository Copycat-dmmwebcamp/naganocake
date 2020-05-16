class Item < ApplicationRecord

	has_many :order_items, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	belongs_to :category
	
	# 画像用
	attachment :item_image

	enum item_status: [:selling, :soldout]
	# selling = 販売中 soldout = 売り切れ
end
