class Item < ApplicationRecord

	has_many :order_items, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	belongs_to :category
	
	# 画像用
	attachment :item_image

	enum item_status: [:selling, :soldout]
	# selling = 販売中 soldout = 売り切れ

	# 商品名、被りNG
	validates :item_name, presence: true, uniqueness: true
	# 説明文、1文字以上
	validates :item_explanation, length: { minimum: 1 }
	validates :category_id, presence: true
	# 税抜価格、数値のみ
	validates :without_tax, numericality: true
	validates :item_status, presence: true
	validates :recomend, inclusion: { in: [true, false] }
end
