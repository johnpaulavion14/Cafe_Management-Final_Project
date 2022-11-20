class ShopDetail < ApplicationRecord

  belongs_to :user

  validates :shop_name, :shop_location, :shop_number, presence: true
  validates :shop_name, length: { maximum: 20 }, uniqueness: true
  validates :shop_location, length: { maximum: 30 }
  validates :shop_number, numericality: true, uniqueness: true, length: { is: 11 }
end
