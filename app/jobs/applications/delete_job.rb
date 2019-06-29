module Applications
  class DeleteJob < ApplicationJob
    queue_as :low
  
    def perform(application)
      #Application delete
      application&.destroy
    end
  end  
end
