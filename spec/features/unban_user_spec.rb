require 'rails_helper'

describe 'Ban user' do
  before do
    @admin = FactoryGirl.create(:admin_user)
    @user = FactoryGirl.create(:banned_user)
  end
  
  context 'from index' do
    it 'should be available to admin' do
      login_as(@admin, :scope => :user)
      visit sellers_path

      expect(page).to have_css("#user_#{@user.id}_unban")
    end

    it 'should not be available for common user' do
      login_as(@user, :scope => :user)
      visit sellers_path

      expect(page).not_to have_css("#user_#{@user.id}_unban")
    end

    it 'should set user.ban as false' do
      login_as(@admin, :scope => :user)
      visit sellers_path
      click_on("user_#{@user.id}_unban")
      @user.reload
      expect(@user.ban).to eql(false)
    end
  end

  context 'from view page' do
    it 'should be available to admin' do
      login_as(@admin, :scope => :user)
      visit seller_path(@user)

      expect(page).to have_css("#user_#{@user.id}_unban")
    end

    it 'should not be available for common user' do
      login_as(@user, :scope => :user)
      visit seller_path(@user)

      expect(page).not_to have_css("#user_#{@user.id}_unban")
    end

    it 'should set user.ban as false' do
      login_as(@admin, :scope => :user)
      visit seller_path(@user)

      click_on("user_#{@user.id}_unban")
      @user.reload
      expect(@user.ban).to eql(false)
    end
  end
end