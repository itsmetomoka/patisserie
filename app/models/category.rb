class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	validates :category_name, presence: true
	scope :only_active, -> { where(is_active: true) }
end
