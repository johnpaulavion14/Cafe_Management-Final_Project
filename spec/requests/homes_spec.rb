require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "#Home" do

    it "get home page" do
      get "/"
      expect(response).to have_http_status(200)
    end
    
  end
end
