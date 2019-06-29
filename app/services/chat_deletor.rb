class ChatDeletor
    def initialize(chat)
      @chat = chat
    end
    
    def execute(application_id)
      @chat.destroy
      RedisHandler.new('application', application_id).decrement
    end
end