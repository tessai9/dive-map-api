# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Points', type: :request do
  let(:sample_point) { create(:point) }

  before { sign_in_as_user(user) }

  describe 'when signed in as admin_user' do
    let(:user) { create :user, :admin_user }

    describe 'GET /region/:region_id/point' do
      it 'valid request' do
        region = create :region
        create_list :point, 10, region: region
        get "/regions/#{region.id}/point"
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:points]).to be_an(Array)
        expect(json_data[:points].length).to eq(10)
      end
    end

    describe 'GET /regions/:region_id/points/:id' do
      it 'valid request' do
        get region_point_path(sample_point.region.id, sample_point.id)
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:id]).to eq(sample_point.id)
        expect(json_data[:name]).to eq(sample_point.name)
        expect(json_data[:point_map]).to eq(sample_point.point_map)
      end
    end

    describe 'POST /regions/:region_id/point' do
      it 'valid request' do
        valid_params = {
          name: '南部だし'
        }
        post "/regions/#{sample_point.region.id}/point", params: { point: valid_params }
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:result]).to eq('ok')
      end

      it 'invalid request(empty name)' do
        invalid_params = { name: '' }
        post "/regions/#{sample_point.region.id}/point", params: { point: invalid_params }

        expect(response.status).to eq(400)
      end
    end

    describe 'PATCH /regions/:region_id/points/:id' do
      it 'valid request' do
        valid_params = {
          name: '内浦ビーチ'
        }
        patch region_point_path(sample_point.region, sample_point), params: { point: valid_params }
        json_data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json_data[:result]).to eq('ok')
      end

      it 'invalid request' do
        invalid_params = {
          name: ''
        }
        patch region_point_path(sample_point.region, sample_point), params: { point: invalid_params }

        expect(response.status).to eq(400)
      end
    end

    describe 'DELETE /regions/:region_id/points/:id' do
      it 'valid request' do
        delete region_point_path(sample_point.region, sample_point)
        expect(response.status).to eq(200)
      end
    end
  end
end
