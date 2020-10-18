class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
    @cart_products = current_customer.cart_products
    @customer = current_customer
    @delivery_fee = Order.new.delivery_fee
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params)
    if params[:order][:address_selection] == "1"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name

    elsif params[:order][:address_selection] =="2"
      @order.post_code = Address.find(params[:order][:address_id]).post_code
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
    else
      @address = Address.new
      @address.post_code =params[:order][:post_code]
      @address.address = params[:order][:address]
      @address.name =params[:order][:name]
      @address.customer_id = current_customer.id
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end

  def create
    order = Order.new(order_params)
    order.save
    if params[:order][:new_address] && params[:order][:select_3]
      address = Address.new
      address.post_code =params[:order][:new_post_code]
      address.address = params[:order][:new_address]
      address.name =params[:order][:new_name]
      address.customer_id = current_customer.id
      address.save
    end
    current_customer.cart_products.each do |cart_product|
      order_item = OrderItem.new
      order_item.product_id = cart_product.product_id
      order_item.order_id = order.id
      order_item.quantity = cart_product.quantity
      order_item.order_price = cart_product.sub_total
      order_item.save
    end
    current_customer.cart_products.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total= 0
    @order_items.each do |order_item|
      @total += order_item.order_price
    end

  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :delivery_fee, :order_status, :post_code, :address, :name, :total_payment)
  end
  def address_params
    params.require(:address).permit(:customer_id, :address, :post_code, :name)
  end
end
