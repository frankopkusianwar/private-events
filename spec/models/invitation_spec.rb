require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe 'associations' do
    it { should belong_to(:invitor) }
    it { should belong_to(:invitee) }
    it { should belong_to(:event) }
  end
end
