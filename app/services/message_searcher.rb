class MessageSearcher
    def initialize(chat_id)
      @chat_id = chat_id
    end
    
    def execute(key)
        Message.search key, where: {chat_id: @chat_id}
    end
end