class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text :orders
      t.integer :user_id

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
