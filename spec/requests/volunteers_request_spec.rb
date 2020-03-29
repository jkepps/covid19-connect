# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Volunteers', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/volunteers/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create', :vcr do
    let(:profession) { FactoryBot.create(:profession) }

    context 'with valid params' do
      let(:params) do
        {
          name: 'New Volunteer',
          zip: '12345',
          profession_id: profession.id,
          phone: "+1#{Faker::PhoneNumber.cell_phone}",
          license: {
            active: true,
            number: '12346689',
            full_name: 'New Special Volunteer',
            state: 'CA'
          }
        }
      end
      let(:make_request) { post '/volunteers', params: { volunteer: params } }

      it 'returns http success' do
        make_request
        expect(response).to have_http_status(302)
      end

      it 'creates a volunter' do
        expect { make_request }.to change(Volunteer, :count).by 1
      end

      it 'redirects to root' do
        make_request
        expect(response).to redirect_to(:root)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        {
          name: 'New Volunteer',
          zip: '12345',
          profession_id: profession.id,
          phone: "+1#{Faker::PhoneNumber.cell_phone}",
          license: {
            active: true,
            number: '12346689',
            full_name: 'New Special Volunteer'
          }
        }
      end
      let(:make_request) { post '/volunteers', params: { volunteer: invalid_params } }

      it 'does not create a volunter' do
        expect { make_request }.to change(Volunteer, :count).by 0
      end

      it 'redirects to new volunteer path' do
        make_request
        expect(response).to redirect_to(new_volunteer_path)
      end
    end
  end
end
