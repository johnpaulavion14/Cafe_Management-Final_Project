require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email' do
    it "email should not be null" do
        user = build(:user)
        user.email = nil
        user.save
        expect(user).to_not be_valid
    end

    it "email is not invalid" do
      user = build(:user)
      user.email = 'email is not valid'
      user.save
      expect(user).to_not be_valid
    end

    it "email should be uniq" do
      user1 = create(:user)
      user1.email = "uniq@test.com"
      user1.save            

      user2 = create(:user)
      user2.email = "uniq@test.com"
      user2.save        
      expect(user2).to_not be_valid
    end
  end
  describe '#password' do
    it "password should not be null" do
        user = build(:user)
        user.password = nil
        user.save
        expect(user).to_not be_valid
    end
  end

end
