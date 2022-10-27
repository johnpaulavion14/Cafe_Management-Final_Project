class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_products, only: %i[ print_summary ]
  
  def create_order
    products = current_user.products.all
    order = current_user.orders

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

    #Creating Orders
    if order.create(orders: order_arrays)
      last_id = order.last.id
      redirect_to order_receipt_path({id:last_id})
    else
      render :checkout
    end

    #Creating Product Sold
    product_names.each do |x|
      product_name = x
      quantity = params[x].to_i
      price = products.find_by(product_name:x).price
      total_price = (price * quantity) + (price * quantity * 0.12)  

      product_sold = current_user.products.find_by(product_name: x).product_solds
      product_sold.create(product_name:product_name,quantity:quantity,price:price,total_price: total_price)
    end

  end

  def order_receipt
    @Shop = current_user.shop_details.first
    @Order = current_user.orders.find(params[:id])
    @Orders = current_user.orders.find(params[:id]).orders
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
    @Order_chart = []
    params_keys = params.keys
    params_values = params.values

    if params_keys.include?("start" && "end") && !params_values.include?("")
      @start_date = Date.parse params[:start] 
      @end_date = Date.parse params[:end] 
    else
      @start_date = Date.today
      @end_date = Date.today + 1
    end    

    day = current_user.orders.where(created_at: @start_date..@end_date)
    @Orders = day.pluck(:orders, :created_at, :id)
    income = day.pluck(:orders).map {|x| x.last[:total_price]}.reduce(:+)
    @Total_income = income == nil ? 0 : income
    @Total_tax = ((income == nil ? 0 : income)/1.12)*0.12

    date_end = (@end_date - @start_date).to_i
    (0..date_end).each do |date|
      day_graph = current_user.orders.where(created_at: @start_date+date..@start_date+date+1)
      income_graph = day_graph.pluck(:orders).map {|x| x.last[:total_price]}.reduce(:+)
      total_income_graph = income_graph == nil ? 0 : income_graph
      order_array = []
      order_array[0] = (@start_date + date).strftime("%b%d")
      order_array[1] = total_income_graph
      @Order_chart.push(order_array)      
    end
    @qwe = @Order_chart

  end

  def sold_products
    @Map_products = []
    params_keys = params.keys
    params_values = params.values
    @Product_Report = []
    total_quantity = []
    price_list = []
    total_sold_price = []
    @begin = current_user.product_solds.first == nil ? Date.today : current_user.product_solds.first.created_at
    @last = current_user.product_solds.last == nil ? Date.today + 1  : current_user.product_solds.last.created_at
    

    if params_keys.include?("start" && "end") && !params_values.include?("")
      @start_date = Date.parse params[:start] 
      @end_date = Date.parse params[:end] 
    else
      @start_date = Date.today
      @end_date = Date.today + 1
    end

    day = current_user.product_solds.where(created_at: @start_date..@end_date)
    case params["sort"] 
      when 'product_asc'
        all_products = day.pluck(:product_name).uniq.sort{ |a, b| a <=> b }
      when 'product_desc'
        all_products = day.pluck(:product_name).uniq.sort{ |a, b| b <=> a }
      when 'price_asc'
        order = day.order(price: :asc)
        all_products = order.pluck(:product_name).uniq
      when 'price_desc'
        order = day.order(price: :desc)
        all_products = order.pluck(:product_name).uniq
      else
        all_products = day.pluck(:product_name).uniq
    end

    all_products.each do |name|
      product_quantity = day.where(product_name: name).pluck(:quantity)
      total_price = day.where(product_name: name).pluck(:total_price)

      product_name = name
      price = day.where(product_name:name).last.price
      quantity = product_quantity.reduce(:+)
      sold_price = total_price.reduce(:+)

      prices = day.where(product_name:name).pluck(:price).uniq
      price_array = []
      prices.each do |x|
        priceXquantity = {}
        price_quantity = day.where(product_name:name).where(price:x).pluck(:quantity).reduce(:+)
        priceXquantity[x] = price_quantity
        price_array.push(priceXquantity)
      end

      product_details = {}
      product_details[:product_name] = product_name
      product_details[:quantity] = quantity
      product_details[:price] = price
      product_details[:price_array] = price_array
      product_details[:sold_price] = sold_price

      #Graph Sold Products
      graph_details = {}
      date_quantity_array = [[name, sold_price]]
      graph_details[:product] = name
      graph_details[:orders] = date_quantity_array
      @Map_products.push(graph_details)

      @Product_Report.push(product_details)
      total_quantity.push(quantity)
      price_list.push(price)
      total_sold_price.push(sold_price)        
    end

    case params["sort"] 
      when 'quantity_asc'
        sorted = total_quantity.sort{ |a, b| a <=> b }
        @Product_Report = sorted.map {|x| @Product_Report.find {|y| y[:quantity] == x}}
      when 'quantity_desc'
        sorted = total_quantity.sort{ |a, b| b <=> a }
        @Product_Report = sorted.map {|x| @Product_Report.find {|y| y[:quantity] == x}}
      when 'total_price_asc'
        sorted = total_sold_price.sort{ |a, b| a <=> b }
        @Product_Report = sorted.map {|x| @Product_Report.find {|y| y[:sold_price] == x}}
      when 'total_price_desc'
        sorted = total_sold_price.sort{ |a, b| b <=> a }
        @Product_Report = sorted.map {|x| @Product_Report.find {|y| y[:sold_price] == x}}
      else
        all_products = day.pluck(:product_name).uniq
    end
    @Total_Quantity = total_quantity.reduce(:+) == nil ? 0 : total_quantity.reduce(:+) 
    @Total_Price = total_sold_price.reduce(:+) == nil ? 0 : total_sold_price.reduce(:+) 
  end

  def print_summary
    @Shop = current_user.shop_details.first
    @Summary = @Product_Report
    
  end

  def delete_order
    current_user.orders.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to all_orders_path, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end

    current_user.product_solds.where(order_transaction_id: params[:id]).destroy_all

  end

  private

  def order_params
    params.permit(:product_name,:price,:quantity)
  end

end



