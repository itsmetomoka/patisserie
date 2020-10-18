class Customers::AddressesController < ApplicationController
    before_action :authenticate_customer!
    before_action :ensure_correct_address, only:[:edit, :update]

  def index
    @address = Address.new
    @customer = current_customer
    #binding.pry
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to request.referer
    else
      @addresses = @current_customer.addresses
      render 'index'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
      @addresses = current_customer.addresses
      @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path, notice: "You have updated address successfully."
    else
      render "edit"
    end
  end

    def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to request.referer
  end

  private

  def address_params
    params.require(:address).permit(:post_code ,:address ,:name)
  end

  def ensure_correct_address
    @addresses = Address.find(params[:id])
    unless @addresses.customer == current_customer
    redirect_to root_path(current_customer)
    end
   end

end
