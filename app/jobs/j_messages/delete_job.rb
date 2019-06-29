module JMessages
  class DeleteJob < ApplicationJob
    queue_as :low

    def perform(message)
      #Message delete
      message&.destroy
    end
  end
end