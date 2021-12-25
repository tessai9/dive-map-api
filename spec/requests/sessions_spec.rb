# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let(:user) { create :user, password: 'password' }
  let(:valid_params) do
    {
      email: user.email,
      password: 'password'
    }
  end
  let(:invalid_params) do
    {
      email: 'invalid@example.com',
      password: 'invalid_password'
    }
  end

  describe 'POST /login' do
    it 'with valid parameters' do
      post login_path, params: { session: valid_params }
      json_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json_data[:token]).to be_present
    end

    it 'with invalid parameters' do
      post login_path, params: { session: invalid_params }

      expect(response.status).to eq(422)
    end
  end
end
