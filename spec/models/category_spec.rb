require 'rails_helper'

RSpec.describe Category, type: :model do
	describe "Validations" do
		before do
			@admin = FactoryGirl.create(:admin_user)
			login_as(@admin)
			@category = FactoryGirl.create(:technology)
		end

		it 'category is valid' do
			expect(@category).to be_valid
		end

		it 'category must have minimum 4 characters' do
			@category.name = "a" * 3
			expect(@category).to_not be_valid
		end

		it 'category must have maximum 15 characters' do
			@category.name = "a" * 16
			expect(@category).to_not be_valid
		end

		it 'cannot be created without name and color' do
			@category.name = nil
			@category.color = nil

			expect(@category).to_not be_valid
		end
	end

	describe "Edit" do
		before do
			@admin = FactoryGirl.create(:admin_user)
			login_as(@admin)
			@category = FactoryGirl.create(:furniture)
		end

		it 'can be edited' do
			@category.name = "technology"
			@category.color = "#fff"

			@category.save
			expect(@category).to be_valid
		end
	end
end