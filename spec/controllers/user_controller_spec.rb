require 'rails_helper'

RSpec.describe Api::V1::UsersController do

  describe 'Users API', type: :request do

    describe 'GET /users' do

      it 'returns all users' do
        FactoryBot.create(:user, username: 'siobhan', email: 'siobhan@test.com', password: 'password')
        FactoryBot.create(:user, username: 'brown', email: 'brown@test.com', password: 'password')

        get '/api/v1/users'

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
      end

    end

    describe 'POST /users' do

      it 'creates a new user' do
        expect {
          post '/api/v1/users', params: {user: {username: 'siobhan', email: 'siobhan@test.com', password: 'password'}}
        }.to change { User.count }.from(0).to(1)

        expect(response).to have_http_status(:created)
      end
    end

    describe 'DELETE /users/:id' do
      it 'deletes a user' do
        FactoryBot.create(:user, username: 'siobhan', email: 'siobhan@test.com', password: 'password')
        delete '/api/v1/users/1'

        expect(response).to have_http_status(:no_content)
      end
    end

  end


end
