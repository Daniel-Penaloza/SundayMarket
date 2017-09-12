require 'rails_helper'

describe ProductPolicy do
  subject { ProductPolicy.new(user, product) }

  before do
    @user1 = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin_user)
    @banned_user = FactoryGirl.create(:banned_user)
    @category = FactoryGirl.create(:technology)
    #product = FactoryGirl.create(:product, user_id: user1.id, category_id: category.id)
  end

  let(:product) { FactoryGirl.create(:product, user_id: @user1.id, category_id: @category.id) }

  context 'for a visitor' do
    let(:user) { nil }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:destroy) }
  end
  
  context 'for a user that is not banned' do

    let(:user) { @user1 }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'for a banned user' do
    let(:user) { FactoryGirl.create(:banned_user) }
    let(:product) { FactoryGirl.create(:product, user_id: user.id, category_id: @category.id) }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'for a product whose user is banned' do
    let(:user) { nil }
    let(:product) { FactoryGirl.create(:product, user_id: @banned_user.id, category_id: @category.id) }

    it { is_expected.to forbid_action(:show) }
  end

  context 'for an admin' do
    let(:user) { FactoryGirl.create(:admin_user) }
    let(:product) { FactoryGirl.create(:product, user_id: @banned_user.id, category_id: @category.id) }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:destroy) }
  end
end
