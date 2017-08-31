require 'rails_helper'

describe 'navigate' do
	before do
		@category_one = FactoryGirl.create(:technology)
		@category_two = FactoryGirl.create(:furniture)
		visit categories_path
	end
	
	it 'can access to the index page' do
		expect(page.status_code).to eq(200)
	end

	it 'has a list of categories' do
		expect(page).to have_content("Technology")
		expect(page).to have_content("Furniture")
	end
end