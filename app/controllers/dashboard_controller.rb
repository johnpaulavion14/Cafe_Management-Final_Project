class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def order

  end

  def create_order
    products = current_user.products.all
    order = current_user.order_transactions

    order_arrays = []
    product_price = []
    
    product_names = params.keys
    product_names.slice!(product_names.length-3,3)
    product_names.slice!(0,1)

    product_names.each do |x|
        product_name = x
        quantity = params[x].to_i
        price = products.find_by(product_name:x).price

        order_details = {}
        order_details[:product_name] = product_name
        order_details[:quantity] = quantity
        order_details[:price] = price

        product_price.push(quantity * price)
  
        order_arrays.push(order_details)

    end

    @Tax = product_price.reduce(:+) * 0.12
    @Total_price = product_price.reduce(:+) + @Tax
    order_arrays.push({total_price: @Total_price, tax: @Tax})

    #Creating Order Transaction
    if order.create(orders: order_arrays)
      last_id = order.last.id
      redirect_to order_receipt_path({id:last_id})
    else
      render :checkout
    end

    #Creating Product Sales
    product_names.each do |x|
      product_name = x
      quantity = params[x].to_i
      price = products.find_by(product_name:x).price

      product_sales = current_user.order_transactions.last.product_sales
      product_sales.create(product_name:product_name,quantity:quantity,price:price,total_price: price*quantity)
    end

  end

  def order_receipt
    @Shop = current_user.shop_details.first
    @Order = current_user.order_transactions.find(params[:id])
    @Orders = current_user.order_transactions.find(params[:id]).orders
    @Orders.pop
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

    if @Checkout.length == 0
      redirect_to products_path
    else
      @Tax = @Price_product.reduce(:+) * 0.12
      @Total_price = @Price_product.reduce(:+) + @Tax
    end
  end

  def all_orders
    @Orders = current_user.order_transactions.pluck(:orders, :created_at, :id)
  end

  def sold_products
    @Product_Report = []

    all_products = current_user.products.all.pluck(:product_name)

    all_products.each do |name|
      product_quantity = current_user.product_sales.where(product_name: name).pluck(:quantity)
      total_price = current_user.product_sales.where(product_name: name).pluck(:total_price)

      product_name = name
      price = current_user.products.find_by(product_name:name).price
      quantity = product_quantity.reduce(:+)
      sold_price = total_price.reduce(:+)

      product_details = {}
      product_details[:product_name] = product_name
      product_details[:quantity] = quantity
      product_details[:price] = price
      product_details[:sold_price] = sold_price

      @Product_Report.push(product_details)

    end

  end
  def delete_order
    current_user.order_transactions.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to all_orders_path, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end

    current_user.product_sales.where(order_transaction_id: params[:id]).destroy_all

  end


  private

  def order_params
    params.permit(:product_name,:price,:quantity)
  end

  

end



