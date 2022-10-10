require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#product_name' do
    it "product_name should not be nil" do
      product = create(:product)
      product.product_name = nil

      expect(product).to_not be_valid
    end
    it "product_name should not more than 20 char" do
      product = create(:product)
      product.product_name = 'this is more than 20 char'

      expect(product).to_not be_valid
    end
    it "product_name should only allow letters" do
      product = create(:product)
      product.product_name = 123

      expect(product).to_not be_valid
    end
  end
  describe '#price' do
    it "price should not be nil" do
      product = create(:product)
      product.price = nil

      expect(product).to_not be_valid
    end
    it "price should be a number" do
      product = create(:product)
      product.price = 'not a number'

      expect(product).to_not be_valid
    end
  end

end
