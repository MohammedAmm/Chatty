module JChats
  class DeleteJob < ApplicationJob
    queue_as :low

    def perform(chat)
      #Chat delete
      chat&.destroy
    end
  end
end