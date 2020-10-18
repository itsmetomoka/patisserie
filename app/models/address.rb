class Address < ApplicationRecord

  belongs_to :customer

  validates :post_code, numericality: {maximum: 7, minimum: 7}
  validates :address, presence: true
  validates :name, presence: true, length: {maximum: 20, minimum: 2}

  def full_receiver_address
  	post_code+" "+address+" "+name
  end
end

