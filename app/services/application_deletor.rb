class ApplicationDeletor
    def initialize(application)
      @application = application
    end
    
    def execute
      @application.destroy
    end
end