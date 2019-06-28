class MessageCreator
    def initialize(chat)
      @chat = chat
    end
    
    def execute(message_params)
      #increament messages_count and chats_number and return with new values
      redis_new_values = RedisHandler.new("applications/#{@chat.application_id}/chat",@chat.number).increment
      #Create message job
      JMessages::StoreJob.perform_later(message_params.merge!(:chat_id => @chat.id, :number => redis_new_values[:number]))
      #Update messages_count within chat
      JChats::UpdateJob.perform_later({:chat_id => @chat.id, :messages_count => redis_new_values[:count]})
      #Return with message number
      redis_new_values[:number]
    end
end