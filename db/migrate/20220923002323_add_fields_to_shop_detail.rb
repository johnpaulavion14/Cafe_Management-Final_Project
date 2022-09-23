class AddFieldsToShopDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :shop_details, :user_id, :integer
  end
end
