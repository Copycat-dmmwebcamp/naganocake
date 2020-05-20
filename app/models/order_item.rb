class OrderItem < ApplicationRecord

	belongs_to :order
	belongs_to :item

	enum production_status: [:status0, :status1, :status2, :status3]
	# 0 = 着手不可　1 = 製作待ち　2 = 製作中　3 = 製作完了

	validates :production_status, inclusion: { in: ["0", "1", "2", "3"] }
	validates :unit_price, presence: true
	# 商品個数は1~100制限
	validates :item_number, numericality: { only_integer: true, greater_than: 0, less_than: 100 }
end
