class CreateOrderTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :order_transactions do |t|
      t.text :orders
      t.integer :user_id

      t.timestamps
    end
    add_index :order_transactions, :user_id
  end
end
