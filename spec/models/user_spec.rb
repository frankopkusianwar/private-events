require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
  end

  describe 'associations' do
    it { should have_many(:invitations).through(:users_invited) }
    it { should have_many(:invites).through(:users_invitors) }
    it { should have_many(:events_created).through(:creates) }
    it { should have_many(:events_attended).through(:attendances) }
    it { should have_many(:events_signed_up).through(:sign_ups) }
  end
end
