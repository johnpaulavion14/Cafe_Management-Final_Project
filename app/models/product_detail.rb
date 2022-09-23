class ProductDetail < ApplicationRecord
    mount_uploader :image, ImgUploader
    belongs_to :user
end
