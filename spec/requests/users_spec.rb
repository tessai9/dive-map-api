# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:admin) { create(:user, :admin_user) }
  let(:official) { create(:user, :official_user) }
  let(:common) { create(:user, :common_user) }

  describe 'GET /users/:id' do
    it 'valid request' do
      get user_path(common)
      json_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json_data[:id]).to eq(common.id)
      expect(json_data[:name]).to eq(common.name)
      expect(json_data[:email]).to eq(common.email)
      expect(json_data[:birthday]).to eq(common.birthday.strftime('%Y-%m-%d'))
    end
  end

  describe 'POST /user' do
    it 'valid request' do
      valid_params = {
        name: 'test',
        email: 'test@example.com',
        role: :common,
        password: 'password',
        birthday: '2021-09-15'
      }
      post '/user', params: { user: valid_params }
      json_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json_data[:result]).to eq('ok')
    end

    it 'bad request(invalid password)' do
      invalid_params = {
        name: 'test',
        email: 'test@example.com',
        role: :common,
        password: 'pass',
        birthday: '2021-09-15'
      }
      post '/user', params: { user: invalid_params }

      expect(response.status).to eq(400)
    end
  end

  describe 'PATCH /users/:id' do
    it 'valid request' do
      valid_params = {
        name: 'test',
        email: 'test@example.com',
        role: :common,
        password: 'password',
        birthday: '2021-09-15'
      }
      patch user_path(common.id), params: { user: valid_params }
      json_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json_data[:result]).to eq('ok')
    end

    it 'bad request(invalid password)' do
      invalid_params = {
        name: 'test',
        email: 'test@example.com',
        role: :common,
        password: 'pass',
        birthday: '2021-09-15'
      }
      patch user_path(common.id), params: { user: invalid_params }

      expect(response.status).to eq(400)
    end
  end

  describe 'DELETE /users/:id' do
    it 'valid request' do
      delete user_path(common)
      expect(response.status).to eq(200)
    end
  end
end
