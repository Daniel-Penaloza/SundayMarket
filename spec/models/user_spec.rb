require 'rails_helper'

RSpec.describe User, type: :model do
	describe "Creation" do
		before do
			@user = FactoryGirl.create(:user)
		end
		

		it 'is a valid user' do
			expect(@user).to be_valid
		end

		it 'can create a user without first_name, last_name, shop_name' do
			@user.first_name = nil
			@user.last_name = nil
			@user.shop_name = nil

			expect(@user).to_not be_valid
		end

		it 'user first_name, last_name, shop_name have at least 4 characters' do
			@user.first_name  = 	    "a" * 3
			@user.last_name   =   		"b" * 3
			@user.shop_name   = 		"c" * 3

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

		it 'user first_name, last_name has 12 characters maximum' do
			@user.first_name 	= 		"a" * 13
			@user.last_name		=		"a" * 13

			expect(@user).to_not be_valid
		end

		it 'shop_name has 20 characters maximum' do
			@user.shop_name 	= 		"a" * 21
			expect(@user).to_not be_valid
		end
	end	
end