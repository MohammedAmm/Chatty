module JChats
  class StoreJob < ApplicationJob
    queue_as :high

    # args application_id, title
    def perform(*args)
      Chat.create!(args)
    end
  end
end