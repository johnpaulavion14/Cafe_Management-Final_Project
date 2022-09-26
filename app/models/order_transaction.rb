class OrderTransaction < ApplicationRecord
    serialize :orders, Array
    belongs_to :product
end
