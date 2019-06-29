class MessageDeletor
    def initialize(message)
      @message = message
    end
    
    def execute(chat)
      @message.destroy
      RedisHandler.new("applications/#{chat.application_id}/chat",chat.number).decrement
    end
end