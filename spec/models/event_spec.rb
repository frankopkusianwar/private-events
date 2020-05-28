require 'rails_helper'

RSpec.describe Event, type: :model do
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
