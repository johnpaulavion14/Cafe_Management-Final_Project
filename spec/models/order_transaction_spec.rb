require 'rails_helper'

RSpec.describe OrderTransaction, type: :model do
  describe '#Orders' do
    it "Order transaction should be in array" do
      order = create(:order_transaction)
      order.orders = [{product_name:"donut", quantity:2, price:15.00},{total_price:33.60, tax:3.59}]

      expect(order).to be_valid
    end
    it "Order transaction should not be nil" do
      order = create(:order_transaction)
      order.orders = nil

      expect(order).to_not be_valid
    end

  end


end
