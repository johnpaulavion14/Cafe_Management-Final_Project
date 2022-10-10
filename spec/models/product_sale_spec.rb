require 'rails_helper'

RSpec.describe ProductSale, type: :model do
  describe '#product_name' do
    it "product_name should not be nil" do
      product = create(:product_sale)
      product.product_name = nil

      expect(product).to_not be_valid
    end
    it "product_name should not more than 20 char" do
      product = create(:product_sale)
      product.product_name = 'this is more than 20 char'

      expect(product).to_not be_valid
    end
    it "product_name should only allow letters" do
      product = create(:product_sale)
      product.product_name = 123

      expect(product).to_not be_valid
    end
  end
  describe '#price' do
    it "price should not be nil" do
      product = create(:product_sale)
      product.price = nil

      expect(product).to_not be_valid
    end
    it "price should be a number" do
      product = create(:product_sale)
      product.price = 'not a number'

      expect(product).to_not be_valid
    end
  end
  describe '#quantity' do
    it "quantity should not be nil" do
      product = create(:product_sale)
      product.quantity = nil

      expect(product).to_not be_valid
    end
    it "quantity should be a nubmer" do
      product = create(:product_sale)
      product.quantity = 'not a number'

      expect(product).to_not be_valid
    end
  end
  describe '#total_price' do
    it "total_price should not be nil" do
      product = create(:product_sale)
      product.total_price = nil

      expect(product).to_not be_valid
    end
    it "total_price should be a nubmer" do
      product = create(:product_sale)
      product.total_price = 'not a number'

      expect(product).to_not be_valid
    end
  end



end
