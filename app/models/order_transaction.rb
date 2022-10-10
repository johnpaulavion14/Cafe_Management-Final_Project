class OrderTransaction < ApplicationRecord
    serialize :orders, Array
    belongs_to :user
    has_many :product_sales

    validates :orders, presence: true
    # validates :orders[:product_name], presence: true
end
