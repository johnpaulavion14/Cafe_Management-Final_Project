class ProductSale < ApplicationRecord

    belongs_to :order_transaction

    validates :product_name,:price,:quantity,:total_price, presence: true
    validates :price,:quantity,:total_price, numericality: true
    validates :product_name, length: { maximum: 20 }, format: { with: /[a-zA-Z]/, message: "only allows letters" }
end
