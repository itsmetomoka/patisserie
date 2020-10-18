class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def top
    now = Time.current
    @orders = Order.where(created_at: now.all_day)
  end

  def about
  end

  def index
    @customers = Customer.with_deleted.all
  end

  def show
    @customer = Customer.with_deleted.find(params[:id])
  end

  def edit
    @customer = Customer.with_deleted.find(params[:id])
  end

  def update
    @customer = Customer.with_deleted.find(params[:id])
    logger.debug(params[:customer][:is_active])
    logger.debug(1111111111)
    if params[:customer][:is_active] == "true"
       @customer.restore
    else
       @customer.destroy
    end

    if @customer.update(customer_params)
       flash[:success] = "会員情報を変更しました"
       redirect_to admins_customer_path
    else
       render "edit"
    end
  end



  private

  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:post_code,:address,:phone_number,:email,:is_active)
  end
end
