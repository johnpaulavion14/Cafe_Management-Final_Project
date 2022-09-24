class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.float :price
      t.string :image

      t.timestamps
    end
  end
end
