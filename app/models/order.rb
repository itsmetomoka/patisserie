class Order < ApplicationRecord

	has_many :order_items, dependent: :destroy
	belongs_to :customer

	enum payment_method: [:クレジットカード, :銀行振り込み]
	enum order_status: [:入金待ち, :入金確認, :製作中, :発送待ち, :発送済]

	attribute :delivery_fee, :integer, default: 800


  def shipping_address
  	"#{self.post_code} #{self.address}"
  end

  def order_count
  	sum = 0
  	self.order_items.each do |order_item|
  	  sum += order_item.quantity
  	end
  	return sum
  end
end
