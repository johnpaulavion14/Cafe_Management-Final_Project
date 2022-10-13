require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "#Product Request" do

    before do
      sign_in create(:user)
    end
    
    it "get product index page" do
      get products_path
      expect(response).to have_http_status(200)
    end

    it "get create new product page " do
      get new_product_path
      expect(response).to have_http_status(200)
    end

    it "get see all product page" do
      get edit_all_products_path
      expect(response).to have_http_status(200)
    end

  end
end
