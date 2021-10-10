require 'rails_helper'

RSpec.describe Api::V1::UsersController do

  describe 'Users API', type: :request do

    describe 'GET /users' do
      before do
        FactoryBot.create(:user, username: 'siobhan', email: 'siobhan@test.com', password: 'password', password_confirmation: 'password')
        FactoryBot.create(:user, username: 'brown', email: 'brown@test.com', password: 'password', password_confirmation: 'password')
      end
      it 'returns all users' do

        get '/api/v1/users'

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
      end
    end

    # describe 'GET /users/:id' do
    #   it 'returns a user' do
    #     FactoryBot.create(:user, username: 'siobhan', email: 'siobhan@test.com', password: 'password', password_confirmation: 'password')

    #     get '/api/v1/users/1'

    #     expect(response).to have_http_status(:success)
    #     # expect(User.find_by_id(1)).to eq(1)
    #   end
    # end

    describe 'POST /users' do

      it 'creates a new user' do
        expect {
          post '/api/v1/users', params: {user: {username: 'siobhan', email: 'siobhan@test.com', password: 'password', password_confirmation: 'password'}}
        }.to change { User.count }.from(0).to(1)

        expect(response).to have_http_status(:created)
      end
    end

    describe 'DELETE /users/:id' do
      let!(:user) { FactoryBot.create(:user, username: 'siobhan', email: 'siobhan@test.com', password: 'password', password_confirmation: 'password') }

      it 'deletes a user' do
        expect {
          delete "/api/v1/users/#{user.id}",
          headers: {"Authorization" => ENV["API_KEY"]}
        }.to change { User.count }.from(1).to(0)

        expect(response).to have_http_status(:no_content)
      end
    end

  end


end
