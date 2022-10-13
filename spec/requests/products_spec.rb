require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "#Product Request" do
    it "product index page" do
      get products_path
      expect(response).to have_http_status(302)
    end

    it "create new product page " do
      get new_product_path
      expect(response).to have_http_status(302)
    end

    it "edit product page" do
      get edit_product_path(1)
      expect(response).to have_http_status(302)
    end

    it "see all product page" do
      get edit_all_products_path
      expect(response).to have_http_status(302)
    end

  end
end
