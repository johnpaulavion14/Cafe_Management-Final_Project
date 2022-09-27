class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def order

  end

  def create_order
    products = current_user.products.all
    order = current_user.order_transactions

    order_arrays = []
    
    product_names = params.keys
    product_names.slice!(product_names.length-3,3)
    product_names.slice!(0,1)

    product_names.each do |x|

      if x == 'total_price'
        order_arrays.push({:total_price => sprintf('%.2f',params[x])})
      else
        order_details = {}
        order_details[:product_name] = x
        order_details[:quantity] = params[x].to_i
        order_details[:price] = products.find_by(product_name:x).price
  
        order_arrays.push(order_details)
      end
     
    end
    
    if order.create(orders: order_arrays)
      redirect_to order_receipt_path
    else
      render :checkout
    end

  end

  def order_receipt
    @Shop = current_user.shop_details.first
    # product = current_user.products.find_by(product_name:params[:name])
    @Order = current_user.order_transactions.last
    @Orders = current_user.order_transactions.last.orders
    @Orders.shift

  end

  def checkout
    @Products = current_user.products.all
    params_names = params.keys
    params_values = params.values
    params_values.slice!(params_values.length-3,3)
    @Checkout = []
    @Price_array = []
    @Price_product = []
    params_values.each_with_index do |quantity,idx|
      if quantity != "" 
        @Checkout.push({params_names[idx]=>quantity})
        @Price_array.push(@Products.find_by(product_name:params_names[idx]).price)
        product = @Products.find_by(product_name:params_names[idx]).price * quantity.to_i
        @Price_product.push(product)
      end
    end
    @Total_price = @Price_product.reduce(:+)

    if @Total_price == nil
      redirect_to products_path
    end

  end


  private

  def order_params
    params.permit(:product_name,:price,:quantity)
  end

  

end



