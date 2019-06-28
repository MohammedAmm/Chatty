module JChats
  class StoreJob < ApplicationJob
    queue_as :default

    def perform(*args)
      # Find Application
      logger.debug(args)
      Chat.create!(args)
    end
  end
end