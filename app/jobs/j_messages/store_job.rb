module JMessages
  class StoreJob < ApplicationJob
    queue_as :default

    def perform(*args)
      Message.create!(args)
    end
  end
end