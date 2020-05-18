class Item < ApplicationRecord

	has_many :order_items, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	belongs_to :category
	
	# 画像用
	attachment :item_image

	enum item_status: [:selling, :soldout]
	# selling = 販売中 soldout = 売り切れ


	validates :item_name, presence: true, uniqueness: true
	validates :item_explanation, presence: true, length: { minimum: 1 }
	validates :category_id, presence: true
	validates :without_tax, presence: true
	validates :item_status, presence: true
	validates :recomend, inclusion: { in: [true, false] }
end
