class OrderTransaction < ApplicationRecord
    serialize :orders, Array
    belongs_to :user
    has_many :product_sales
end
