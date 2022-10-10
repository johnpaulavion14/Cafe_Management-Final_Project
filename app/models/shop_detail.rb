class ShopDetail < ApplicationRecord

  belongs_to :user

  validates :shop_name, :shop_location, :shop_number, presence: true
  validates :shop_name, length: { maximum: 20 }
end
