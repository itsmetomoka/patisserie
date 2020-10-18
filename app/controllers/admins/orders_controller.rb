class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@orders =Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    if  params[:order][:order_status] == "入金確認"
        @order.order_items.each do |order_item|
          order_item.update(making_status: "製作待ち")
        end
    end
    @order.update(order_params)
    redirect_to admins_order_path(@order)
  end

    private
  def order_params
      params.require(:order).permit(:order_status)
  end

end
