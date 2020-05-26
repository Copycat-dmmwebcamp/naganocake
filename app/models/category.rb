class Category < ApplicationRecord

	has_many :items, dependent: :destroy

	# 空でない、一意性があるか、
	validates :name, presence: true, uniqueness: true
	validates :category_status, inclusion: { in: [true, false] }
end
