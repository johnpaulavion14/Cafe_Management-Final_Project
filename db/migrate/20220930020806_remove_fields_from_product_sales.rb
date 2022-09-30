class RemoveFieldsFromProductSales < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_sales, :user_id, :integer
  end
end
