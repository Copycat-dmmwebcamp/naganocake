class Category < ApplicationRecord

	has_many :items, dependent: :destroy

	validates :name, presence: true
	validates :category_status, inclusion: { in: [true, false] }
end
