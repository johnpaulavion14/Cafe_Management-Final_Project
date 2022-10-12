require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "#Product Request" do
    it "product index" do
      get products_path
      expect(response).to have_http_status(302)
    end

    it "product index" do
      get new_product_path
      expect(response).to have_http_status(302)
    end

    it "product index" do
      get edit_product_path(1)
      expect(response).to have_http_status(302)
    end

    it "product index" do
      get edit_all_products_path
      expect(response).to have_http_status(302)
    end

  end
end
