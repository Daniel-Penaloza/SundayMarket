require 'rails_helper'

describe 'navigate' do
	before do
		@user = FactoryGirl.create(:user)
		login_as(@user)
		@category = FactoryGirl.create(:technology)
		@product1 = FactoryGirl.create(:product_with_short_description, user_id: @user.id, category_id: @category.id)
		@product2 = FactoryGirl.create(:product_two, user_id: @user.id, category_id: @category.id)
		visit root_path
	end
	describe 'homepage' do
		it "can be the index view for products" do
			click_on("products_index_path")
			expect(current_path).to eq(products_path)
		end

		it "the index view has a list of products" do
			visit products_path
			expect(page.status_code).to eq(200)

			expect(page).to have_content(/Television samsung 30 inches 4k | Iphone 7 Plus/)
	  		expect(page).to have_content(/The best tv in the market | Smartphone with the latest technology/)
			expect(page).to have_content(450.00)
			expect(page).to have_content(350.00)
		end

		it "can reach the show view for products" do
			visit products_path
			click_on("product_#{@product1.id}_name")
			expect(current_path).to  eq(product_path(@product1))
			expect(page).to have_content("Television Samsung 30 Inches 4k")
			expect(page).to have_content("The best tv in the market")
			expect(page).to have_content("[\"4k technology\", \"3 HDMI ports\", \"Smart tv\"]")
		end
	end

	describe "edit" do
		it "cannot be edited from other user that not creates the product" do
			user = FactoryGirl.create(:other_user)
			login_as(user)

			visit(product_path(@product1))
			expect(page.status_code).to eq(200)

			expect(page).to_not have_css("#product_#{@product1.id}_edit")
			expect(page).to_not	have_css("#product_#{@product1.id}_delete")
		end

		it "can be reached the edit view" do
			visit(product_path(@product1))
			expect(page.status_code).to eq(200)
		end

		it "can edit a product" do 
			visit edit_product_path(@product1)
			expect(page.status_code).to eq(200)

			fill_in "product[name]", with: "This is a new product"
			fill_in "product[summary]", with: "This is a summary for new product"
			fill_in "product[price]", with: 1050.00
			click_on("Update The Product")
			
			expect(current_path).to eq(product_path(@product1))
			expect(@product1.reload.name).to eq("This is a new product")
			expect(@product1.reload.summary).to eq("This is a summary for new product")
		end
	end
end