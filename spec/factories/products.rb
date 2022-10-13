FactoryBot.define do
  factory :product do
    user
    sequence(:product_name) {|n| "string#{n}"}
    price {100.00}
    image {"image"}
  end
end
