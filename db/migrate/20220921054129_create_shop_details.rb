class CreateShopDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_details do |t|
      t.string :shop_name
      t.string :shop_location
      t.string :shop_number
      t.integer :user_id

      t.timestamps
    end
    add_index :shop_details, :user_id
  end
end
