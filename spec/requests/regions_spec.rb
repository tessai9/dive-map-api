# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regions', type: :request do
  let(:single_region) { create(:region) }

  describe 'GET /region' do
    before do
      create_list :region, 10
    end

    it 'valid request' do
      get '/region'
      json_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json_data[:regions]).to be_an(Array)
      expect(json_data[:regions].length).to eq(10)
    end
  end

  describe 'GET /regions/:id' do
    it 'valid request' do
      get region_path(single_region)
      json_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json_data[:id]).to eq(single_region.id)
      expect(json_data[:name]).to eq(single_region.name)
      expect(json_data[:prefecture][:name]).to eq(single_region.prefecture_name)
    end
  end

  describe 'POST /region' do
    it 'valid request' do
      valid_params = {
        name: '白浜',
        prefecture: single_region.prefecture_id
      }
      post '/region', params: { region: valid_params }
      json_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json_data[:result]).to eq('ok')
    end

    it 'invalid request(no prefecture)' do
      invalid_params = {
        name: '串本'
      }
      post '/region', params: { region: invalid_params }

      expect(response.status).to eq(400)
    end
  end

  describe 'PATCH /regions/:id' do
    it 'valid request' do
      valid_params = {
        name: '柏島',
        prefecture: single_region.prefecture_id
      }
      patch region_path(single_region), params: { region: valid_params }
      json_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json_data[:result]).to eq('ok')
    end

    it 'invalid request' do
      invalid_params = {
        prefecture: single_region.prefecture_id
      }
      patch region_path(single_region), params: { region: invalid_params }

      expect(response.status).to eq(400)
    end
  end

  describe 'DELETE /regions/:id' do
    it 'valid request' do
      delete region_path(single_region)
      expect(response.status).to eq(200)
    end
  end
end
