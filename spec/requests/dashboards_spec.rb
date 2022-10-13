require 'rails_helper'

RSpec.describe "Dashboards", type: :request 

  describe "#Dashboard Request" do
    before do
      sign_in create(:user)
    end
    it "all orders page" do
      get all_orders_path
      expect(response).to have_http_status(200)
    end    
    
    it "sold products page" do
      get sold_products_path
      expect(response).to have_http_status(200)
    end

end
