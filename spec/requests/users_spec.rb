require 'rails_helper'

RSpec.describe 'Users', type: %w[request feature] do
  before do
    post '/api/v1/users',
         params: { username: 'Boaz Aduda' }
    @user = User.all.last
  end

  it 'renders the users list' do
    get '/api/v1/users/'
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body).size).to eq(User.count)
  end

  it 'renders the requested user' do
    get "/api/v1/users/#{@user.id}"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)['username']).to eq('Boaz Aduda')
  end

  it 'deletes the requested user' do
    delete "/api/v1/users/#{@user.id}"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body).size).to eq(User.count)
  end

  it 'updates a user' do
    new_user = { username: 'Italo' }
    put "/api/v1/users/#{@user.id}", params: new_user
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)['username']).to eq('Italo')
  end
end
