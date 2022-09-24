class Product < ApplicationRecord
    mount_uploader :image, ImgUploader
    belongs_to :user
    has_many :order_transactions
end
