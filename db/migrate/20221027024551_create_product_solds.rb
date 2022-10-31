class CreateProductSolds < ActiveRecord::Migration[7.0]
  def change
    create_table :product_solds do |t|
      t.string :product_name
      t.float :price
      t.integer :quantity
      t.float :tax
      t.float :total_price
      t.integer :product_id

      t.timestamps
    end
    add_index :product_solds, :product_id
  end
end
