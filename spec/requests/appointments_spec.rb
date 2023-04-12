require 'rails_helper'

RSpec.describe 'Appointments', type: %w[request feature] do
  before do
    post '/api/v1/users',
         params: { username: 'Boaz Aduda' }
    @user = User.all.last

    post '/api/v1/doctors',
         params: { doctor: { name: 'Raymond', lastname: 'Olisa', speciality: 'Surgeon',
                             experience: 10, consultation: 200.0, image: 'https://doctorphoto.com/profile.png' } }

    @doctor = Doctor.all.last

    post '/api/v1/appointments',
         params: { appointment: { user: @user.id, doctor: @doctor.id, datetime: '2023-04-10T12:00:00.000Z',
                                  city: 'New-York' } },
         headers: { Authorization: @token }

    @appointment = Appointment.all.last
  end

  it 'renders the doctors appointments list' do
    get '/api/v1/appointments'
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body).size).to eq(Appointment.count)
  end
end
