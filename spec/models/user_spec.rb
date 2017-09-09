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
									  password: "asdfasdf", password_confirmation: "asdfasdf")
			
			expect(user_image.image) != nil
		end
	end
	describe "check_url" do
		it "should return false if url does not have http or https" do
			@user = FactoryGirl.create(:user)
			@user.website = "test-test.test.test"
			expect(check_url(@user.website)).to eql(false)
		end
		it "should return true if url does have http" do
			@user = FactoryGirl.create(:user)
			@user.website = "http://test-test.test.test"
			expect(check_url(@user.website)).to eql(true)
		end
		it "should return true if url does have https" do
			@user = FactoryGirl.create(:user)
			@user.website = "https://test-test.test.test"
			expect(check_url(@user.website)).to eql(true)
		end
	describe "fix_url" do
		it "should return the original url if it's in right format"

	end
	end
end