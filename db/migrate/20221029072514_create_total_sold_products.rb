class CreateTotalSoldProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :total_sold_products do |t|
      t.string :product_name
      t.float :price
      t.integer :quantity
      t.float :tax
      t.float :total_price
      t.integer :user_id

      t.timestamps
    end
    add_index :total_sold_products, :user_id
  end
end


