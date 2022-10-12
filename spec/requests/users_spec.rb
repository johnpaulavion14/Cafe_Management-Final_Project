require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "#Devise Request" do
    it "sign in page" do
      get user_session_path
      expect(response).to have_http_status(200)
    end
    it "sign up page" do
      get  new_user_registration_path
      expect(response).to have_http_status(200)
    end
    it "sign out page" do
      delete  destroy_user_session_path
      expect(response).to have_http_status(302)
    end
  end
end
