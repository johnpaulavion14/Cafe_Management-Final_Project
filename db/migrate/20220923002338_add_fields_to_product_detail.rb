class AddFieldsToProductDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :product_details, :user_id, :integer
  end
end
