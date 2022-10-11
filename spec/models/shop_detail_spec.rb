require 'rails_helper'

RSpec.describe ShopDetail, type: :model do
  describe '#shop_name' do
    it "shop_name should not be nil" do
      shop = create(:shop_detail)
      shop.shop_name = nil

      expect(shop).to_not be_valid
    end
    it "shop_name should be uniq" do
      shop1 = create(:shop_detail, shop_number: +6312345678911)
      shop1.shop_name = "same shop"
      shop1.save

      shop2 = create(:shop_detail)
      shop2.shop_name = "same shop"  
      shop2.save    

      expect(shop2).to_not be_valid
    end
    it "shop_name should not be more than 20 char" do
      shop = create(:shop_detail)
      shop.shop_name = "abcdefghijklmnopqrstu more than 20 char"

      expect(shop).to_not be_valid
    end

  end  
  describe '#shop_location' do
    it "shop_location should not be nil" do
      shop = create(:shop_detail)
      shop.shop_location = nil

      expect(shop).to_not be_valid
    end
    it "shop_location should not be more than 30 char" do
      shop = create(:shop_detail)
      shop.shop_location = "abcdefghijklmnopqrstuvwxyz more than 30 char"

      expect(shop).to_not be_valid
    end

  end 
  describe '#shop_number' do
    it "shop_number should not be nil" do
      shop = create(:shop_detail)
      shop.shop_number = nil

      expect(shop).to_not be_valid
    end
    it "shop_number should be a number" do
      shop = create(:shop_detail)
      shop.shop_number = "not a number"

      expect(shop).to_not be_valid
    end
    it "shop_number should be equal to 13 char" do
      shop = create(:shop_detail)
      shop.shop_number = 1234567890

      expect(shop).to_not be_valid
    end
    it "shop_number should be uniq" do
      shop1 = create(:shop_detail, shop_number: +6312345678911)

      shop2 = create(:shop_detail)
      shop2.shop_number = +6312345678911
      shop2.save

      expect(shop2).to_not be_valid
    end

  end 
end
