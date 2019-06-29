module Applications
  class UpdateJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      # update application record
      application = Application.find(args[0][:application_id])
      application.update(args[0].except(:application_id))
    end
  end  
end
