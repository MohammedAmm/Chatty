module Applications
  class UpdateJob < ApplicationJob
    queue_as :low
  
    def perform(*args)
      # logger.debug(args[0][:application_id])
      # Do something later
      logger.debug(args[0])
      application = Application.find(args[0][:application_id])
      application.update(args[0].except(:application_id))
    end
  end  
end
