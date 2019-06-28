class ApplicationCreator
    def initialize(application_params)
      @application_params = application_params
    end
    
    def execute
      #Createnew Application
      application = Application.create!(@application_params)
      #Initialize Redis's key with zero
      RedisHandler.new('application', application.id).create
      #Return with generated object
      application
    end
end