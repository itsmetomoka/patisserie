class Product < ApplicationRecord
	belongs_to :category
	attachment :image
	has_many :cart_products, dependent: :destroy
	has_many :order_items, dependent: :destroy

# 税込価格の計算小数点以下切り捨て
	def include_tax
		(price * 1.08).floor
	end
end
