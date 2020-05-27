require 'rails_helper'

RSpec.describe SignUp, type: :model do
  describe 'associations' do
    it { should belong_to(:User) }
    it { should belong_to(:Event) }
  end
end
