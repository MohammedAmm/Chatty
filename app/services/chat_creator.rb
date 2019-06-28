class ChatCreator
    def initialize(application)
      @application = application
    end
    
    def execute(chat_params)
        #increament chats_count and chats_number and return with new values
        redis_new_values = RedisHandler.new('application',@application.id).increment
        #create new redis key for messages_count and messages_number
        RedisHandler.new("applications/#{@application.id}/chat", redis_new_values[:number]).create
        #create chat job
        JChats::StoreJob.perform_later(chat_params.merge!(:application_id => @application.id, :number => redis_new_values[:number]))
        #update chats_count using job
        Applications::UpdateJob.perform_later({:application_id => @application.id, :chats_count => redis_new_values[:count]})  
        #return with new created chat number
        redis_new_values[:number]
    end
end