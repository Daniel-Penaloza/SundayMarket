require 'rails_helper'

describe 'navigate index' do
	it 'can reach the categories view' do
		visit categories_path
		expect(page.status_code).to eq(200)
	end

	it 'can create a category if the user is admin' do
		@admin = FactoryGirl.create(:admin_user)
		login_as(@admin)

		visit new_category_path
		expect(page.status_code).to eq(200)

		click_on("category-new-link")
		fill_in	"category[name]", with: "Technology"
		click_on("btn-new-category")
		
		expect(page).to have_content("The category was created successfully.")
		expect(page).to have_content("Technology")
		expect(current_path).to eq(categories_path)
	end

	it 'cannot create a user a regular user' do
		@user = FactoryGirl.create(:user)
		login_as(@user)

		visit new_category_path
		expect(current_path).to eq(root_path)
		expect(page).to have_content("You are not authorized to perform this action.")
	end

	it 'the category has a count of products' do
		user = FactoryGirl.create(:user)
		category = FactoryGirl.create(:technology)
		product1 =  FactoryGirl.create(:product, user_id: user.id, category_id: category.id)
		product2 =  FactoryGirl.create(:product_two, user_id: user.id, category_id: category.id)

		visit categories_path
		expect(page).to have_content("2 products in this category.")
	end
end

describe 'navigate show' do
	before do
		@user = FactoryGirl.create(:user)
		@category = FactoryGirl.create(:technology)
		@product1 =  FactoryGirl.create(:product_with_short_description, user_id: @user.id, category_id: @category.id)
		@product2 =  FactoryGirl.create(:product_with_long_description, user_id: @user.id, category_id: @category.id)

		visit categories_path
	end
	
	it 'can reach the show view with some products' do
		visit categories_path
		expect(page.status_code).to eq(200)

		#Testing with pure text
		click_on("category_#{@category.id}_show")
		expect(page).to have_content("Technology")
		expect(page).to have_content("2 products in this category.")
		expect(page).to have_content(450.00)

		expect(page).to have_content("Television Samsung 30 Inches 4k")
		expect(page).to have_content("The best tv in the market")
		expect(page).to have_content(/4k technology|3 HDMI porst|Smart tv/)

		#Testing with instances variables and eq
		expect(@product2.name).to eq("Iphone 7 Plus")
		expect(@product2.summary).to eq("Smartphone with the latest technology")
		expect(@product2.price).to eq(350.00)
		@product2.descriptions.each do |description|
			expect(description.name).to eq("[\"Excellent Status 10 of 10\", \"The most coolest phone\", \"Liberated for any carrier\"]")
		end
	end

	it 'cannot edit a category if you are not the admin' do
		@regular_user = FactoryGirl.create(:other_user)
		login_as(@regular_user)

		visit edit_category_path(@category)
		expect(current_path).to eq(root_path)
		expect(page).to have_content("You are not authorized to perform this action.")
	end

	it 'just an admin can edit a category ' do
		@admin = FactoryGirl.create(:admin_user)
		login_as(@admin)

		visit edit_category_path(@category)
		fill_in "category[name]", 	with: "Cycling"
		fill_in "category[color]", 	with: "#fff"
		click_on("Update The Category")

		expect(current_path).to eq(category_path(@category))
		expect(page).to have_content("Category successfully updated.")
		expect(page).to have_content("Cycling")
		expect(page).to have_content("2 products in this category")
	end
end

