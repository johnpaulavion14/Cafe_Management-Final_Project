class DropProductSales < ActiveRecord::Migration[7.0]
  def change
    drop_table :product_sales
  end
end
