class Customers::CartProductsController < ApplicationController
	before_action :authenticate_customer!
  before_action :set_cart_product


  def index
  	@customer = Customer.find(current_customer.id)
  end

  def create
  	# カートプロダクトに追加したい商品が入ってない場合
  	unless @cart_products.exists?(product_id: params[:product_id])
  		cart_product = @cart_products.new(cart_product_params)

  		if cart_product.save
  		  redirect_to product_cart_products_path
      else
        flash[:alert] = "個数を指定してください"
        redirect_to product_path(params[:product_id])
      end

  	# すでに入ってた場合
  	else
  		cart_product = CartProduct.find_by(customer_id: current_customer.id, product_id: params[:product_id])
  		new_cart_product = CartProduct.new(cart_product_params)
  		cart_product.quantity += new_cart_product.quantity
  		if cart_product.save
  		  redirect_to product_cart_products_path
      else
        flash[:alert] = "個数を指定してください"
        redirect_to product_path(product.id)
      end
  	end
  end

  def update
  	cart_product = CartProduct.find_by(customer_id: current_customer.id, product_id: params[:product_id])
  	cart_product.update(cart_product_params)
		redirect_back(fallback_location: root_path)
  end


  def destroy
  	cart_product = @cart_products.find_by(id: params[:id], product_id: params[:product_id])
  	cart_product.destroy
  	redirect_back(fallback_location: root_path)
  end

# 　カートの中身全て消す
  def destroy_all
  	@cart_products.destroy_all
  	redirect_back(fallback_location: root_path)
  end


# 　ユーザーのカートのアイテムを取り出す
  def set_cart_product
  	@cart_products = current_customer.cart_products
  end


  private
  	def cart_product_params
  		params.require(:cart_product).permit(:custoemr_id, :product_id, :quantity)
  	end
end
