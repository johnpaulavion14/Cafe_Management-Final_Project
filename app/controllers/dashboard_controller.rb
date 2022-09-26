class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def order

  end

  def create_order
    product = current_user.products.find_by(product_name:params[:product_name])
    if product.order_transactions.create(order_params)
      redirect_to order_receipt_path({name:params[:product_name]})
    else
      render :order
    end
  end

  def order_receipt
    @shop = current_user.shop_details.first
    product = current_user.products.find_by(product_name:params[:name])
    @order = product.order_transactions.last

  end

  def checkout
    
  end






  private

  def order_params
    params.permit(:product_name,:price,:quantity)
  end

end



