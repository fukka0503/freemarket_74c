class DeliveryAddressesController < ApplicationController
  def new
    @delivery_address = DeliveryAddress.new
  end

  def create
    if @delivery_address.save
      redirect_to root_path
    else
      redirect_to new_delivery_address_path
    end
  end

end
