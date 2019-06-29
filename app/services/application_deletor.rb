class ApplicationDeletor
    def initialize(application)
      @application = application
    end
    
    def execute
      #Preform deleting application job with low priority
      Applications::DeleteJob.perform_later(@application)
    end
end