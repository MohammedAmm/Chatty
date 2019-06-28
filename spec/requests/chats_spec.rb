# spec/requests/chats_spec.rb
require 'rails_helper'

RSpec.describe 'Chats API' do
  # Initialize the test data
  let!(:application) { create(:application) }
  let!(:chats) { create_list(:chat, 5, application_id: application.id) }
  let(:application_token) { application.token }
  let(:number) { chats.first.number }

  # Test suite for GET /applications/:application_token/chats
  describe 'GET /applications/:application_token/chats' do
    before { get "/applications/#{application_token}/chats" }

    context 'when application exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all application chats' do
        expect(json.size).to eq(5)
      end
    end

    context 'when application does not exist' do
      let(:application_token) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Application/)
      end
    end
  end

#   # Test suite for GET /applications/:application_token/chats/:number
  describe 'GET /applications/:application_token/chats/:number' do
    before { get "/applications/#{application_token}/chats/#{number}" }

    context 'when application chat exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the chat' do
        expect(json['number']).to eq(number)
      end
    end

    context 'when application chat does not exist' do
      let(:number) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Chat/)
      end
    end
  end

  # Test suite for Post /applications/:application_token/chats
  # describe 'POST /applications/:application_token/chats' do
  #   let(:valid_attributes) { { title: 'Visit Narnia' } }

  #   context 'when request attributes are valid' do
  #     before { post "/applications/#{application_token}/chats", params: valid_attributes }
      
  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when an invalid request' do
  #     before { post "/applications/#{application_token}/chats", params: {} }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #     it 'returns a failure message' do
  #       expect(response.body).to match(/param is missing or the value is empty: title/)
  #     end
  #   end
  # end

  # Test suite for PUT /applications/:application_token/chats/:number
  describe 'PUT /applications/:application_token/chats/:number' do
    let(:valid_attributes) { { title: 'Mozart' } }

    before { put "/applications/#{application_token}/chats/#{number}", params: valid_attributes }

    context 'when chat exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the chat' do
        updated_chat = Chat.find_by_number(number)
        expect(updated_chat.title).to match(/Mozart/)
      end
    end

    context 'when the chat does not exist' do
      let(:number) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Chat/)
      end
    end
  end

  # Test suite for DELETE /applications/:application_token/chats/:number
  describe 'DELETE /applications/:application_token/chats/:number' do
    before { delete "/applications/#{application_token}/chats/#{number}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
