require 'rails_helper'

RSpec.describe 'Doctors', type: %w[request feature] do
  before do
    post '/api/v1/users',
         params: { username: 'Raymond Olisa' }
    @user = User.all.last

    post '/api/v1/doctors',
         params: { doctor: { name: 'Raymond', lastname: 'Olisa', speciality: 'Surgeon',
                             experience: 10, consultation: 200.0, image: 'https://doctorphoto.com/profile.png' } }
    @doctor = Doctor.all.last
  end

  it 'renders the doctors list' do
    get '/api/v1/doctors/'
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body).size).to eq(Doctor.count)
  end

  it 'renders the requested doctor' do
    get "/api/v1/doctors/#{@doctor.id}"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)['name']).to eq('Raymond')
    expect(JSON.parse(response.body)['lastname']).to eq('Olisa')
    expect(JSON.parse(response.body)['speciality']).to eq('Surgeon')
    expect(JSON.parse(response.body)['experience']).to eq(10)
    expect(JSON.parse(response.body)['consultation'].to_f).to eq(200.0)   
  end

  it 'updates a doctor' do
    new_doctor = { doctor: { name: 'Italo', lastname: 'Lon Kan', speciality: 'Optician',
                             experience: 12, consultation: 250.0, image: 'https://doctorimage.com/profile.png' } }
    put "/api/v1/doctors/#{@doctor.id}", params: new_doctor
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)['name']).to eq('Italo')
    expect(JSON.parse(response.body)['lastname']).to eq('Lon Kan')
    expect(JSON.parse(response.body)['speciality']).to eq('Optician')
  end

  it 'deletes the requested doctor' do
    delete "/api/v1/doctors/#{@doctor.id}"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body).size).to eq(Doctor.count)
  end
end
