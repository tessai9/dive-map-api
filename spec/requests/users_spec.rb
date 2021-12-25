# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before { sign_in_as_user(user) }

  context 'when signed in as admin_user' do
    let(:user) { create :user, :admin_user }
    let(:valid_params) do
      valid_params = {
        name: 'test',
        email: 'test@example.com',
        role: :common,
        password: 'password',
        birthday: '2021-09-15'
      }
    end

    let(:invalid_params) do
      invalid_params = {
        name: 'test',
        email: 'test@example.com',
        role: :common,
        password: 'pass',
        birthday: '2021-09-15'
      }
    end

    describe 'GET /users/:id' do
      it 'valid request' do
        common = User.create! valid_params
        get user_path(common)
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:id]).to eq(common.id)
        expect(json_data[:name]).to eq(common.name)
        expect(json_data[:email]).to eq(common.email)
        expect(json_data[:birthday]).to eq(common.birthday.strftime('%Y-%m-%d'))
      end
    end

    describe 'POST /users' do
      it 'valid request' do
        post '/user', params: { user: valid_params }
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:result]).to eq('ok')
      end

      it 'bad request(invalid password)' do
        post '/user', params: { user: invalid_params }

        expect(response.status).to eq(400)
      end
    end

    describe 'PATCH /users/:id' do
      let(:new_params) do
        {
          name: 'sample name',
          email: 'new@example.com'
        }
      end

      it 'valid request' do
        common = User.create! valid_params
        patch user_path(common), params: { user: new_params }
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:result]).to eq('ok')
      end

      it 'bad request(invalid password)' do
        common = User.create! valid_params
        patch user_path(common), params: { user: invalid_params }

        expect(response.status).to eq(400)
      end
    end

    describe 'DELETE /users/:id' do
      it 'valid request' do
        common = User.create! valid_params
        delete user_path(common)
        expect(response.status).to eq(200)
      end
    end
  end
end
