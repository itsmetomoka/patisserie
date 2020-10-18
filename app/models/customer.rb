class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy

  with_options presence: true do
    validates :email, format: {with: /\A\S+@\S+\.\S+\z/,message: 'が正しくありません'}
    validates :post_code, format: {with: /\A\d{7}\z/,message: 'が正しくありません'}
    validates :phone_number, format: {with: /\A\d{10,11}\z/,message: 'が正しくありません'}
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'は漢字,ひらがな,カタカナのいずれかで入力してください'}do
      validates :first_name
      validates :last_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/,message: 'はカタカナで入力してください'}do
      validates :first_name_kana
      validates :last_name_kana
    end
  end

  # 送料抜きの合計金額
  def total
		total = 0
		cart_products.each do |cart_product|
			total += cart_product.sub_total
		end
		total
	end

  # 送料込みの合計金額
  def total_price
    total_price = total+Order.new.delivery_fee
  end

  def full_address
    post_code+ " " + address
  end

  def full_name
    "#{self.last_name} #{self.first_name}"
  end

  def full_name_kana
  	"#{self.last_name_kana} #{self.first_name_kana}"
  end


  def self.search(word)
    @customer = Customer.where(["last_name LIKE? OR first_name LIKE? OR first_name_kana LIKE? OR last_name_kana LIKE?","%#{word}%","%#{word}%","%#{word}%","%#{word}%"])
  end
  
  acts_as_paranoid
end

