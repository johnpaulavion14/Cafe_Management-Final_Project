FactoryBot.define do
  factory :product do
    user
    product_name {"string"}
    price {100.00}
    image {"image"}
  end
end
