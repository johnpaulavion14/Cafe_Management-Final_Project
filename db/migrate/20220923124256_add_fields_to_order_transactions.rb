class AddFieldsToOrderTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :order_transactions, :product_id, :integer
    add_index :order_transactions, :product_id
  end
end
