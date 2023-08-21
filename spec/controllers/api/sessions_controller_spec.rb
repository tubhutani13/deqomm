require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
  let!(:user) { create(:user, email: 'test@example.com', password: 'password') }

  describe 'POST #create' do
    context 'with valid credentials' do
      let(:valid_params) do
        { email: 'test@example.com', password: 'password' }
      end

      it 'returns a token on successful login' do
        post :create, params: valid_params
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to include('token')
      end
    end

    context 'with invalid credentials' do
      let(:invalid_params) do
        { email: 'test@example.com', password: 'wrong_password' }
      end

      it 'returns an unauthorized response' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
