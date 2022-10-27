class Product < ApplicationRecord
    mount_uploader :image, ImgUploader
    belongs_to :user
    has_many :product_solds

    validates :product_name,:price, presence: true
    validates :price, numericality: true
    validates :product_name, uniqueness: true, length: { maximum: 20 }, format: { with: /[a-zA-Z]/, message: "only allows letters" }
   

end
