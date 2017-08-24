require 'rails_helper'

RSpec.describe User, type: :model do
	describe "Creation" do
		before do
			@user = FactoryGirl.create(:user)
		end
		
		it "can be created" do
			expect(@user).to be_valid
		end

		it "user cannot be created without first_name and last_name" do
			@user.first_name = nil
			@user.last_name = nil
			expect(@user).to_not be_valid
		end

		it "user is created with a default image" do
			user_image = User.create!(first_name: "seller", last_name: "user", email: "userseller@test.com",
									  phone: "9876543210", password: "asdfasdf", password_confirmation: "asdfasdf")
			
			expect(user_image.image) != nil
		end
	end
end