require 'rails_helper'

describe "registration / login / logout process" do	
	it 'can reach the registration page' do
		visit root_path
		expect(page.status_code).to eq(200)

		click_on("register_link")
		expect(current_path).to eq(new_user_registration_path)
	end

	it 'a user can be register properly' do
		visit(new_user_registration_path)
		expect(page.status_code).to eq(200)
		fill_in "user[first_name]", 			with:  "Oliver"
		fill_in "user[last_name]",  			with:  "Bucks"
		fill_in	"user[email]", 					with:  "Oliverbucks@test.com"
		fill_in "user[password]",				with:  "Oliver123"
		fill_in	"user[password_confirmation]",  with:  "Oliver123"
		fill_in	"user[shop_name]",				with:  "Ollie's Shop"
		fill_in	"user[website]",				with:  "www.olliesshop.com"
		fill_in	"user[shop_description]",		with:  "Lorem ipsum dolor sit amet, consectetur 
														adipisicing elit. Nostrum pariatur numquam autem, 
														libero animi minima porro, commodi at in eum aperiam 
														odit accusantium perspiciatis eligendi ipsum 
														ratione minus, tempora itaque."
		
		click_on("btn-signup")
		expect(current_path).to eq(root_path)
		expect(page).to have_content(" Welcome! You have signed up successfully.")
		expect(page).to have_content("Oliver Bucks")
	end

	it 'can reach the login page' do
		visit new_user_session_path
		expect(page.status_code).to eq(200)
	end


	it 'can login propperly' do
		visit root_path
		expect(page.status_code).to eq(200)

		@user = FactoryGirl.create(:user)
		click_on("login_link")
		expect(current_path).to eq(new_user_session_path)
		fill_in "user[email]", 			with: @user.email
		fill_in	"user[password]",		with: @user.password
		click_on("btn-login")
		expect(current_path).to eq(root_path)
		expect(page).to have_content("Seller Usershop")
	end

	it 'cannot see the admin dashboard link if is a regular user' do
		@user = FactoryGirl.create(:user)
		login_as(@user, :scope => :user)

		visit admin_root_path
		expect(page).to have_content("You are not authorized to access this page")
		expect(current_path).to eq(root_path)
	end

	it 'and admin can access to the admin dashboard' do
		@admin = FactoryGirl.create(:admin_user)
		login_as(@admin, :scope => :user)

		visit admin_root_path
		expect(page.status_code).to eq(200)
	end


	it 'can logout properly' do
		@user = FactoryGirl.create(:user)
		login_as(@user, :scope => :user)

		visit root_path
		click_on("logout_link")
		expect(page).to have_content("Signed out successfully.")
		expect(page).to_not have_content("Seller Usershop")
		expect(page.current_path).to eq(root_path)
	end
end