module JChats
  class UpdateJob < ApplicationJob
    queue_as :low
  
    def perform(*args)
      # logger.debug(args[0][:chat_id])
      # Do something later
      chat = Chat.find(args[0][:chat_id])
      chat.update(args[0].except(:chat_id))
    end
  end  
end
