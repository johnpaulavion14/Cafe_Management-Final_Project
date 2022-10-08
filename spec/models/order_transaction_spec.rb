require 'rails_helper'

RSpec.describe OrderTransaction, type: :model do
  describe '#Orders' do
    it "Order transaction should be in array" do
        order = create(:order_transaction)
        order.orders = ['orders is array']

        expect(order).to be_valid
    end



  end


end
