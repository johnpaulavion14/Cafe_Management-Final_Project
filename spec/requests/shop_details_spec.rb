require 'rails_helper'

RSpec.describe "ShopDetails", type: :request do

  describe "#Shop_details Request" do

    before do
      sign_in create(:user)
    end
    
    it "get shop details page" do
      get shop_path
      expect(response).to have_http_status(200)
    end

    it "get create shop details page" do
      post create_details_path
      expect(response).to have_http_status(302)
    end
    
  end
end
