class OrderItem < ApplicationRecord

	belongs_to :order, optional: true
	belongs_to :product, optional: true
 	enum making_status: [:着手不可, :製作待ち ,:製作中 ,:製作完了]


end
