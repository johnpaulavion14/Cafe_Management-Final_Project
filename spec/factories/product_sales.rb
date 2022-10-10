FactoryBot.define do
  factory :product_sale do
    order_transaction
    product_name {"string"}
    price {100.00}
    quantity {1}
    total_price {100.00}
  end
end
