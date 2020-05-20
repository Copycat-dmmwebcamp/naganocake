class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	belongs_to :end_user

	enum order_status: [:stage0, :stage1, :stage2, :stage3, :stage4]
    #0 = 入金待ち　1 = 入金確認　2 = 製作中　3 = 発送準備中　4 = 発送済み

    enum payment_info: [:credit, :bank]
    # credit = クレジット　bank = 銀行払い

    validates :payment_info, inclusion: { in: ["0", "1"] }
    validates :destination, presence: true
    validates :delivery_address, presence: true
    validates :postal_code, presence: true
    validates :postage, presence: true
    validates :billing_amount, presence: true
    # enum型、数値に変わっているため０〜４が含まれているかを書く
    validates :order_status, inclusion: {in: [ "0", "1", "2", "3", "4"] }
    validates :end_user_id, presence: true

end
