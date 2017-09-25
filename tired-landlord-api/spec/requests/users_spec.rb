require 'rails_helper'

RSpec.describe 'Users API', type: :request do
	describe 'POST /users' do
		let(:valid_attributes) { { email: 'example@email.com', password_digest: '123456' } }

		context 'when the request is valid' do
			before { post '/users', params: valid_attributes }

			it 'creates a user' do
        expect(json['email']).to eq('example@email.com')
      end

      it 'return status code 201' do
      	expect(response).to have_http_status(201)
      end
		end

		context 'when the request is invalid' do
			before { post '/users', params: { email: 'user1@email.com' } }

			it 'returns status code 422' do
				expect(response).to have_http_status(422)
			end
		end

	end
end