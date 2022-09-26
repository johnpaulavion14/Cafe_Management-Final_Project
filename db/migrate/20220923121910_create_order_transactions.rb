class CreateOrderTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :order_transactions do |t|
      t.text :orders

      t.timestamps
    end
  end
end
