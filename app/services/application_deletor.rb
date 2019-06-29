class ApplicationDeletor
    def initialize(application)
      @application = application
    end
    
    def execute
      #Preform deleting application job with low priority
      Applications::DeleteJob.perform_later(@application)
      #Delete from redis with all related keys
      RedisHandler.new('application', @application.id).delete
    end
end