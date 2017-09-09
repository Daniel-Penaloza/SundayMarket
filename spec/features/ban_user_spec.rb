require 'rails_helper'

describe 'Ban user' do
  before do
    @admin = FactoryGirl.create(:admin_user)
    @user = FactoryGirl.create(:user)
  end
  context 'from index' do
    it 'should be available to admin' do
      login_as(@admin, :scope => :user)
      visit sellers_path

      expect(page).to have_css("#user_#{@user.id}_ban")
    end

    it 'should not be available for common user' do
      login_as(@user, :scope => :user)
      visit sellers_path

      expect(page).not_to have_css("#user_#{@user.id}_ban")
    end
    
    it 'should set user.ban as true' do
      login_as(@admin, :scope => :user)
      visit sellers_path
    end
  end

  context 'from view page' do
    it 'should be available to admin' do
      login_as(@admin, :scope => :user)
      visit seller_path(@user)

      expect(page).to have_css("#user_#{@user.id}_ban")
    end

    it 'should not be available for common user' do
      login_as(@user, :scope => :user)
      visit seller_path(@user)

      expect(page).not_to have_css("#user_#{@user.id}_ban")
    end
    
    it 'should set user.ban as true' do
      login_as(@admin, :scope => :user)
      visit seller_path(@user)

      click_on("#user_#{@user.id}_ban")
      expect(@user.ban).to eql(true)
    end
  end
end