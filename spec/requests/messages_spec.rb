# # spec/requests/messages_spec.rb
# require 'rails_helper'

# RSpec.describe 'Chats API' do
#   # Initialize the test data
#   let!(:application) { create(:application) }
#   let!(:chat) { create(:chat, application_id: application.id) }
#   let!(:messages) { create_list(:message, 20, chat_id: chat.id) }
#   let(:application_token) { application.token }
#   let(:chat_number) { chat.number }
#   let(:number) { messages.first.number }

#   # Test suite for GET /applications/:application_token/chats/:chat_number/messages
#   describe 'GET /applications/:application_token/chats/:chat_number/messages' do
#     before { get "/applications/#{application_token}/chats/#{chat_number}/messages" }

#     context 'when application exists' do
#       context 'when chat exists' do
#         it 'returns status code 200' do
#           expect(response).to have_http_status(200)
#         end

#         it 'returns all chat messages' do
#           expect(json.size).to eq(20)
#         end
#       end

#       context 'when chat does not exist' do
#         let(:chat_number) { 0 }
  
#         it 'returns status code 404' do
#           expect(response).to have_http_status(404)
#         end
  
#         it 'returns a not found message' do
#           expect(response.body).to match(/Couldn't find Chat/)
#         end
#       end
#     end

#     context 'when application does not exist' do
#       let(:application_token) { 0 }

#       it 'returns status code 404' do
#         expect(response).to have_http_status(404)
#       end

#       it 'returns a not found message' do
#         expect(response.body).to match(/Couldn't find Application/)
#       end
#     end
#   end

#   # Test suite for GET /applications/:application_token/chats/:chat_number/messages/:number
#   describe 'GET /applications/:application_token/chats/:chat_number/messages/:number' do
#     before { get "/applications/#{application_token}/chats/#{chat_number}/messages/#{number}" }

#     context 'when chat message exists' do
#       it 'returns status code 200' do
#         expect(response).to have_http_status(200)
#       end

#       it 'returns the message' do
#         expect(json['number']).to eq(number)
#       end
#     end

#     context 'when chat message does not exist' do
#       let(:number) { 0 }

#       it 'returns status code 404' do
#         expect(response).to have_http_status(404)
#       end

#       it 'returns a not found message' do
#         expect(response.body).to match(/Couldn't find Message/)
#       end
#     end
#   end

#   # Test suite for Post /applications/:application_token/chats/:chat_number/messages
#   # describe 'POST /applications/:application_token/chats/:chat_number/messages' do
#   #   let(:valid_attributes) { { body: 'Visit Narnia' } }

#   #   context 'when request attributes are valid' do
#   #     before { post "/applications/#{application_token}/chats/#{chat_number}/messages", params: valid_attributes }
      
#   #     it 'returns status code 201' do
#   #       expect(response).to have_http_status(201)
#   #     end
#   #   end

#   #   context 'when an invalid request' do
#   #     before { post "/applications/#{application_token}/chats/#{chat_number}/messages", params: {} }

#   #     it 'returns status code 422' do
#   #       expect(response).to have_http_status(422)
#   #     end

#   #     it 'returns a failure message' do
#   #       expect(response.body).to match(/param is missing or the value is empty: body/)
#   #     end
#   #   end
#   # end

#   # Test suite for Put /applications/:application_token/chats/:chat_number/messages/:number
#   describe 'PUT /applications/:application_token/chats/:chat_number/messages/:number' do
#     let(:valid_attributes) { { body: 'Mozart' } }

#     before { put "/applications/#{application_token}/chats/#{chat_number}/messages/#{number}", params: valid_attributes }

#     context 'when message exists' do
#       it 'returns status code 204' do
#         expect(response).to have_http_status(204)
#       end

#       it 'updates the message' do
#         updated_message = Message.find_by!(number: number)
#         expect(updated_message.body).to match(/Mozart/)
#       end
#     end

#     context 'when the message does not exist' do
#       let(:number) { 0 }

#       it 'returns status code 404' do
#         expect(response).to have_http_status(404)
#       end

#       it 'returns a not found message' do
#         expect(response.body).to match(/Couldn't find Message/)
#       end
#     end
#   end

#   # Test suite for DELETE /applications/:application_token/chats/:chat_number/messages/:number
#   describe 'DELETE /applications/:application_token/chats/:chat_number/messages/:number' do
#     before { delete "/applications/#{application_token}/chats/#{chat_number}/messages/#{number}" }

#     it 'returns status code 204' do
#       expect(response).to have_http_status(204)
#     end
#   end
# end
