# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before { sign_in_as_user(user) }

  context 'when signed in as admin_user' do
    let(:user) { create :user, :admin_user }
    let(:valid_params) do
      {
        name: 'test',
        email: 'test@example.com',
        role: :common,
        password: 'password',
        birthday: '2021-09-15'
      }
    end

    let(:invalid_params) do
      {
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
        post users_path, params: { user: valid_params }
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:result]).to eq('ok')
      end

      it 'bad request(invalid password)' do
        post users_path, params: { user: invalid_params }

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

  context 'when signed in as official_user' do
    let(:user) { create :user, :official_user }
    let(:valid_params) do
      {
        name: 'test',
        email: 'test@example.com',
        role: :common,
        password: 'password',
        birthday: '2021-09-15'
      }
    end

    describe 'GET /users/:id' do
      it 'valid request' do
        get user_path(user)

        expect(response.status).to eq(200)
      end
    end

    describe 'POST /users' do
      it 'valid request' do
        post users_path, params: { user: valid_params }
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:result]).to eq('ok')
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
        patch user_path(user), params: { user: new_params }
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:result]).to eq('ok')
      end
    end

    describe 'DELETE /users/:id' do
      it 'valid request' do
        delete user_path(user)
        expect(response.status).to eq(403)
      end
    end
  end

  context 'when signed in as common_user' do
    let(:user) { create :user, :common_user }
    let(:valid_params) do
      {
        name: 'test',
        email: 'test@example.com',
        password: 'password',
        birthday: '2021-09-15'
      }
    end

    describe 'GET /users/:id' do
      it 'valid request' do
        get user_path(user)
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:id]).to eq(user.id)
        expect(json_data[:name]).to eq(user.name)
        expect(json_data[:email]).to eq(user.email)
        expect(json_data[:birthday]).to eq(user.birthday.strftime('%Y-%m-%d'))
      end
    end

    describe 'POST /users' do
      it 'valid request' do
        post users_path, params: { user: valid_params }
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:result]).to eq('ok')
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
        patch user_path(user), params: { user: new_params }
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:result]).to eq('ok')
      end
    end

    describe 'DELETE /users/:id' do
      it 'valid request' do
        delete user_path(user)
        expect(response.status).to eq(200)
      end
    end
  end
end
