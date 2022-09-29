class AddFieldsToProductSales < ActiveRecord::Migration[7.0]
  def change
    add_column :product_sales, :total_price, :float
  end
end
