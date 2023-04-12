require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject do
    Doctor.new(name: 'Raymond', lastname: 'Olisa', speciality: 'Surgeon',
               experience: 10, consultation: 200, image: 'https://doctorphoto.com/profile.png')
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'Name should be valid' do
      expect(subject).to be_valid
    end

    it 'Name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Specialization should be present' do
      subject.speciality = nil
      expect(subject).to_not be_valid
    end
  end
end
