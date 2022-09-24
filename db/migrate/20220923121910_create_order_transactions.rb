class CreateOrderTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :order_transactions do |t|
      t.string :product_name
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
