require 'rails_helper'

describe 'navigate' do
	before do
		@user = FactoryGirl.create(:user)
		login_as(@user)
		@category = FactoryGirl.create(:technology)
		@product1 = FactoryGirl.create(:product, user_id: @user.id, category_id: @category.id)
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
			expect(page).to have_content("Television samsung 30 inches 4k")
			expect(page).to have_content("The best tv in the market")
			expect(page).to have_content(/4k technology | 3 HDMI porst | Smart tv | 30 inches/)
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

			expect(page).to have_css("#product_#{@product1.id}_edit")
			click_link("product_#{@product1.id}_edit")	
			expect(current_path).to eq(edit_product_path(@product1))	
		end

		it "can edit a product" do 
			visit edit_product_path(@product1)
			expect(page.status_code).to eq(200)

			fill_in "product[name]", with: "Samsung Television 4k 32 inches"
			fill_in "product[summary]", with: "Excellent condition 2 months of use"
			fill_in "product[price]", with: 450.00
			click_on("")
			fill_in "product[description]", with: "description 1"

			@product1.reload
			puts "#{@product1.to_yaml}"
		end
	end
end