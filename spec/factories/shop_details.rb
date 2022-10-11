FactoryBot.define do
  factory :shop_detail do
    user
    sequence(:shop_name) {|n| "string#{n}"}
    shop_location {"string"}
    shop_number { +6312345678910 }
    # sequence(:shop_number) {|n| "+63123456789#{n}" }
    
  end
end
