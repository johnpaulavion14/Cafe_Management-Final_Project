class OrderTransaction < ApplicationRecord
    serialize :orders, Array
    belongs_to :user
end
