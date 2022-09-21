class CreateShopDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_details do |t|
      t.string :shop_name
      t.string :shop_location
      t.string :business_type

      t.timestamps
    end
  end
end
