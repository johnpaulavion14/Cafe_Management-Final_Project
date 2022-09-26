class AddFieldsToOrderTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :order_transactions, :user_id, :integer
    add_index :order_transactions, :user_id
  end
end
