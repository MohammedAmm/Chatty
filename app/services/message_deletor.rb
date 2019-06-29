class MessageDeletor
    def initialize(message)
      @message = message
    end
    
    def execute(chat)
      #Preform deleting message job with low priority
      JMessages::DeleteJob.perform_later(@message)
      #Decrement messages_count
      messages_count = RedisHandler.new("applications/#{chat.application_id}/chat",chat.number).decrement
      #Update messages_count within chat
      JChats::UpdateJob.perform_later({:chat_id => chat.id, :messages_count => messages_count})
    end
end