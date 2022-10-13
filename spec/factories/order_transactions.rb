FactoryBot.define do
  factory :order_transaction do
    user
    orders { [{:product_name=>"donut", :quantity=>2, :price=>15.0},{:total_price=>33.6, :tax=>3.59}] }
    id {1}
  end
end
