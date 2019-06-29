class ChatDeletor
    def initialize(chat)
      @chat = chat
    end
    
    def execute(application_id)
      #Preform deleting chat job with low priority
      JChats::DeleteJob.perform_later(@chat)
      #Decrement chats_count
      chats_count = RedisHandler.new('application', application_id).decrement
      #Decrement chats_count record at application table
      Applications::UpdateJob.perform_later({:application_id => application_id, :chats_count => chats_count})  
    end
end