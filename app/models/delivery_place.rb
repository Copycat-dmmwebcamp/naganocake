class DeliveryPlace < ApplicationRecord

	belongs_to :end_user


	validates :end_user_id, presence: true
    # 郵便番号数字7桁のみ
    validates :postal_code, presence: true
	validates :address, presence: true
	validates :destination, presence: true


	def full_info
    self.postal_code+ '　' + self.address + '　' +   self.destination
  end
end
