require 'rails_helper'

RSpec.describe Appointment, type: :model do
  user = User.create(username: 'Boaz')
  doctor = Doctor.create(name: 'Raymond', lastname: 'Olisa', speciality: 'Surgeon',
                         experience: 10, consultation: 200, image: 'https://doctorphoto.com/profile.png')

  subject do
    Appointment.new(user:, doctor:, datetime: '2023-04-10T12:00:00.000Z', city: 'New-York')
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'Description should be present' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it 'Appointment datetime should be present' do
      subject.datetime = nil
      expect(subject).to_not be_valid
    end

    it 'Appointment_user should be present' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'Appointment_doctor should be present' do
      subject.doctor_id = nil
      expect(subject).to_not be_valid
    end
  end
end
