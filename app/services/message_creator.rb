class MessageCreator
    def initialize(chat)
      @chat = chat
    end
    
    def execute(message_params)
        message_number = @chat.messages_redis_key_increament('messages_number')
        JMessages::StoreJob.perform_later(message_params.merge!(:chat_id => @chat.id, :number => message_number))
        JChats::UpdateJob.perform_later({:chat_id => @chat.id, :messages_count => @chat.messages_redis_key_increament('messages_count')})
        message_number
    end
end