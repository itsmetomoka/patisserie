class Admins::OrderItemsController < ApplicationController
  def update
  	@order_item = OrderItem.find(params[:id])
  	@order_item.update(order_item_params)
  	order = @order_item.order
  	if  order.order_items.count == order.order_items.where(making_status: "製作完了").count
  		order.update(order_status: "発送待ち")
  	elsif
  		order.order_items.count == order.order_items.where(making_status: "製作中").count
  		order.update(order_status: "製作中")
  	end
  	redirect_to admins_order_path(@order_item.order)
  end

  private
  def order_item_params
      params.require(:order_item).permit(:making_status)
  end
end
