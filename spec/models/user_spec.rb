require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  describe 'validations' do
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

  describe '#check_invited' do
    let(:event) { FactoryBot.build(:event) }
    it 'should return true if the user is invited' do
      inv = Invitation.new
      inv.invitee = subject
      inv.invitor = subject
      inv.event = event
      inv.save
      expect(subject.check_invited?(event)).to be(true)
    end
  end

  describe '#check_signed_up?' do
    let(:event) { FactoryBot.build(:event) }
    it 'should return true if the user has signed_up' do
      sign_up = SignUp.new
      sign_up.User = subject
      sign_up.Event = event
      sign_up.save
      expect(subject.check_signed_up?(event)).to be(true)
    end
  end
end
