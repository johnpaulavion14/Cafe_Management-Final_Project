class Order < ApplicationRecord
    serialize :orders, Array
    belongs_to :user

    validates :orders, presence: true
    # validates :orders[:product_name], presence: true
end
