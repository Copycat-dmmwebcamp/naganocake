class OrderItem < ApplicationRecord

	belongs_to :order
	belongs_to :item

	enum production_status: [:status0, :status1, :status2, :status3]
	# 0 = 着手不可　1 = 製作待ち　2 = 製作中　3 = 製作完了
end
