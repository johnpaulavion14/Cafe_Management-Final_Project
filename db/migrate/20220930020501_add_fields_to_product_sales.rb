class AddFieldsToProductSales < ActiveRecord::Migration[7.0]
  def change
    add_column :product_sales, :order_transaction_id, :integer
    add_index :product_sales, :order_transaction_id
  end
end
