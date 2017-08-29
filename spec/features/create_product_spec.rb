require 'rails_helper'

RSpec.feature "Create Product" do
  before do
    user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)
    @category = FactoryGirl.create(:category)
    product1 = FactoryGirl.create(:product)
  end
  scenario "A user creates a new product" do
    visit "/"

    click_link "New product"

    fill_in "Name", with: "Memory"
    fill_in "Price", with: 15.00
    fill_in "Summary", with: "A memory"
    fill_in "Description", with: "Super memory"
    select(@category.name)
    click_button "Create Product"
    expect(page).to have_content("Product has been added to the catalogue")
    expect(page.current_path).to eq(products_path)
  end
end