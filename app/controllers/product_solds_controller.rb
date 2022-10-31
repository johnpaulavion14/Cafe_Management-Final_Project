class ProductSoldsController < ApplicationController
  before_action :authenticate_user!

  def sold_products
    @Map_products = []
    params_keys = params.keys
    @begin = current_user.product_solds.first == nil ? Date.today : current_user.product_solds.first.created_at
    @last = current_user.product_solds.last == nil ? Date.today + 1  : current_user.product_solds.last.created_at

    if params_keys.include?("start") && params_keys.include?("end")
      @start_date = Date.parse params[:start] 
      @end_date = Date.parse params[:end] 
    else
      @start_date = Date.today
      @end_date = Date.today + 1
    end

    day = current_user.product_solds.where(created_at: @start_date..@end_date)

    array_product_names = day.pluck(:product_name).uniq

    current_user.total_sold_products.all.destroy_all

    array_product_names.each do |name|

      product_name = name
      quantity = day.where(product_name: name).pluck(:quantity).reduce(:+)
      price = day.where(product_name: name).last.price
      tax = day.where(product_name: name).pluck(:tax).reduce(:+)
      total_price = day.where(product_name: name).pluck(:total_price).reduce(:+)

      product_sold = current_user.total_sold_products
      product_sold.create(product_name:product_name,quantity:quantity,price:price,tax: tax, total_price: total_price)


      #Graph Sold Products
      graph_details = {}
      name_price_array = [[name, total_price]]
      graph_details[:product] = name
      graph_details[:orders] = name_price_array
      @Map_products.push(graph_details)
    end
  
    total_sold_products = current_user.total_sold_products

    @q = total_sold_products.ransack(params[:q])
    @Sold_products = @q.result(distinct: true)

    @Total_quantity = day.pluck(:quantity).reduce(:+)
    @Total_Price = day.pluck(:total_price).reduce(:+)
    @Tax = day.pluck(:tax).reduce(:+)

    @With_data = !current_user.total_sold_products.empty?

  end

  def print_summary
    @Shop = current_user.shop_details.first
    @Summary = current_user.total_sold_products

    @Total_quantity = current_user.total_sold_products.pluck(:quantity).reduce(:+)
    @Total_income = current_user.total_sold_products.pluck(:total_price).reduce(:+)
    @Total_tax = current_user.total_sold_products.pluck(:tax).reduce(:+)

    @start_date = Date.parse params[:start] 
    @end_date = Date.parse params[:end] 
    
  end

end
