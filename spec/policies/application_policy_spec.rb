require 'rails_helper'

describe ApplicationPolicy, type: :policy do
  subject { described_class.new(user, resource) }

  let(:resource) { double('any resource') }

  context 'for a visitor' do
    let(:user) { nil }

    it { is_expected.not_to permit(:create) }
    it { is_expected.not_to permit(:new) }
    it { is_expected.not_to permit(:destroy) }
    it { is_expected.not_to permit(:show) }
    it { is_expected.not_to permit(:index) }
    it { is_expected.not_to permit(:update) }
    it { is_expected.not_to permit(:edit) }
  end

  context 'for a regular user' do
    let(:user) { build(:user) }

    it { is_expected.not_to permit(:create) }
    it { is_expected.not_to permit(:new) }
    it { is_expected.not_to permit(:destroy) }
    it { is_expected.not_to permit(:show) }
    it { is_expected.not_to permit(:index) }
    it { is_expected.not_to permit(:update) }
    it { is_expected.not_to permit(:edit) }
  end

  context 'for an admin user' do
    let(:user) { build(:admin_user) }

    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:new) }
    it { is_expected.to permit(:destroy) }
    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:edit) }
  end
end
