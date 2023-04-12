require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(username: 'Raymond')
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'Username should be valid' do
      expect(subject).to be_valid
    end

    it 'Username should be present' do
      subject.username = nil
      expect(subject).to_not be_valid
    end
  end
end
