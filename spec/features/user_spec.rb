require 'rails_helper'

describe 'Behavior' do
	describe "index page" do
		it "has a list of users" do
			#Creation of the users
			user1 = FactoryGirl.create(:user)
			user2 = FactoryGirl.create(:other_user)
			user3 = FactoryGirl.create(:admin_user)

			visit root_path
			click_on("Sellers")
			expect(current_path).to eq(sellers_path)

			#If everything is ok then we need to have a list of users
			expect(page).to have_content(user1.full_name)
			expect(page).to have_content(user2.full_name)
			expect(page).to have_content(user3.full_name)
			
			#The image of the users need to be present
			expect(page).to have_css("img.user-image-index")

		end
	end

	describe "show page" do
		it 'user have displayed properly the full name' do
			@user = FactoryGirl.create(:user)
			visit seller_path(@user)
			expect(page.status_code).to eq(200)

			#In the show view of the seller we need to have at least this
			expect(page).to have_content("Hi I'm #{@user.full_name}")
			expect(page).to have_content("0123456789")	
		end
	end

	describe "edit page" do
		before do
			@user = FactoryGirl.create(:user)
			login_as(@user, :scope => :user)
			visit seller_path(@user)
		end

		it 'user can reach the edit view' do
			click_on("edit_#{@user.full_name}_seller")
			expect(current_path).to eq(edit_seller_path(@user))
			expect(page.status_code).to eq(200)

			expect(page).to have_content("Edit #{@user.full_name}")
			
			fill_in "user[first_name]", with: "another"
			fill_in "user[last_name]", with: "profile"
			fill_in "user[email]", with: "anotherprofile@test.com"
			fill_in "user[phone]", with: "1098765432"
			click_on("Update User")
			expect(current_path).to eq(seller_path(@user))

			#Reloads the attributes of the current object from the database
			@user.reload
			expect(@user.full_name).to eq("Another Profile")
			expect(@user.email).to eq("anotherprofile@test.com")
		end
	end
end