require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { FactoryBot.build(:event, date: '1991/03/03') }
  let (:future) { FactoryBot.build(:event, date: '3000/08/08') }
  describe 'validations' do
    subject { FactoryBot.build(:event) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:location) }
  end

  describe 'associations' do
    it { should belong_to(:creator) }
    it { should have_many(:users_invited).through(:invitations) }
  end

  describe '#past?' do
    it 'should return a Past concernig if the date of the event is in the past' do
      expect(subject.past?).to eq('Past')
    end

    it 'should return a Coming concernig if the date of the event is in the future' do
      expect(future.past?).to eq('Coming')
    end
  end
end
