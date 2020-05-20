class CartItem < ApplicationRecord

	belongs_to :end_user
	belongs_to :item

	# 数値限定、0より大きい
	validates :item_number, numericality: { only_integer: true, greater_than: 0, less_than: 100 }

end
