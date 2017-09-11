require 'rails_helper'

describe UserPolicy do
  subject { described_class.new(@user, user) }

  before do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin_user)
  end

  let(:user) { nil }

  it 'should not show banned user' do
    @user.update(ban: true)
    is_expected.to forbid_action(:show)
  end

  context 'for a visitor' do
    it { is_expected.to permit_action(:show) }

    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_actions([:ban_seller, :unban_seller]) }
  end

  context 'for a user' do
    let(:user) { @user }

    it { is_expected.to permit_action(:show) }

    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to forbid_actions([:ban_seller, :unban_seller]) }
  end

  context 'for an admin' do
    subject { described_class.new(user, @user) }
    let(:user) { @admin }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_actions([:ban_seller, :unban_seller]) }
  end
end
