class DeliveryPlace < ApplicationRecord

	belongs_to :end_user

	def full_info
    self.postal_code+ '　' + self.address + '　' +   self.destination
  end
end
