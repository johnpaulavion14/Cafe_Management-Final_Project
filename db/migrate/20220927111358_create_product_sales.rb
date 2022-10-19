class CreateProductSales < ActiveRecord::Migration[7.0]
  def change
    create_table :product_sales do |t|
      t.string :product_name
      t.float :price
      t.integer :quantity
      t.float :total_price
      t.integer :order_transaction_id

      t.timestamps
    end
    add_index :product_sales, :order_transaction_id
  end
end
