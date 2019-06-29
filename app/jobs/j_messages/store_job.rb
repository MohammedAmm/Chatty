module JMessages
  class StoreJob < ApplicationJob
    queue_as :high

    # args chat_id, body
    def perform(*args)
      Message.create!(args)
    end
  end
end