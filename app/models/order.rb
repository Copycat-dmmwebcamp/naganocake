class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	belongs_to :end_user

	enum order_status: [:stage0, :stage1, :stage2, :stage3, :stage4]
    #0 = 入金待ち　1 = 入金確認　2 = 製作中　3 = 発送準備中　4 = 発送済み

    enum payment_info: [:credit, :bank]
    # credit = クレジット　bank = 銀行払い


=======

end
