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
			@user.shop_name   = 			"c" * 3

			expect(@user).to_not be_valid
		end

		it 'user first_name, last_name has 12 characters maximum' do
			@user.first_name 	= 		"a" * 13
			@user.last_name		=			"a" * 13

			expect(@user).to_not be_valid
		end

		it 'shop_name has 20 characters maximum' do
			@user.shop_name 	= 		"a" * 21
			expect(@user).to_not be_valid
		end

		it "user is created with a default image" do
			user_image = User.create!(first_name: "seller", last_name: "user",
										shop_name:"testingtest", email: "userseller@test.com",
									  password: "asdfasdf", password_confirmation: "asdfasdf")
			
			expect(user_image.image) != nil
		end

		it 'is created with ban being false' do
			expect(@user.ban).to eql(false)
		end
	end

	describe 'is_banned?' do
		it 'should say the user is banned' do
			@user = FactoryGirl.build_stubbed(:user)
			@user.ban = true
			expect(@user.is_banned?).to eq("This user is banned")
		end
		it 'should say the user is not banned' do
			@user = FactoryGirl.build_stubbed(:user)
			expect(@user.is_banned?).to eq("This user isn't banned")
		end
	end
end