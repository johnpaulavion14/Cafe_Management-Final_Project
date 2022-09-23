class ShopDetail < ApplicationRecord

  belongs_to :user

  validates :shop_name, :shop_location, :business_type, presence: true 
end
