require 'rails_helper'

RSpec.describe 'Users, type::request' do
  describe 'Get /users' do
    it 'Test Success' do
      get '/users'
      expect(response.status).to eq(200)
    end

    it 'The view is what we expect' do
      get '/users'
      expect(response.body).to include('List of users below')
    end
  end

  describe 'Get user/:id' do
    it 'Test success' do
      user = FactoryBot.create(:user)
      get "/users/#{user.id}"
      expect(response.status).to eq(200)
    end
  end
end
