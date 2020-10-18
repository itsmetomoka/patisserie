class Customers::CustomersController < ApplicationController
	before_action :authenticate_customer!
	def show
		@customer = current_customer
	end
	def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def index
  end

  	# ユーザー退会画面
  	def check
  	end

  	# ユーザー退会
  	def withdrawal
		current_customer.destroy
		current_customer.update(is_active: false)
		redirect_to root_path
  	end

	private
		def customer_params
			params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :email, :post_code, :address, :phone_number)
		end
end
