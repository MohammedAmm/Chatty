class ChatCreator
    def initialize(application)
      @application = application
    end
    
    def execute(chat_params)
        chat_number = @application.chats_redis_key_increament('chats_number')
        JChats::StoreJob.perform_later(chat_params.merge!(:application_id => @application.id, :number => chat_number))
        Applications::UpdateJob.perform_later({:application_id => @application.id, :chats_count => @application.chats_redis_key_increament('chats_count')})  
        chat_number
    end
end