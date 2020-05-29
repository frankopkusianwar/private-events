require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }
  let(:events) { Event.all }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
  end

  describe 'associations' do
    it { should have_many(:invitations).through(:users_invited) }
    it { should have_many(:invites).through(:users_invitors) }

  end

  describe '#prev_events' do
    it 'should return a list of all previous events' do
      expect(subject.prev_events(events)).to be_an(Array)
    end
  end

  describe '#coming_events' do
    it 'should return a list of all future events' do
      expect(subject.prev_events(events)).to be_an(Array)
    end
  end

  describe '#attended_events' do
    it 'should return a list of all attended events' do
      expect(subject.prev_events(events)).to be_an(Array)
    end
  end
end
