class ApplicationsController < MainApplicationController
  include Applicationable::Initialize
  require 'sidekiq/api'
  # GET /applications
  def index
    Sidekiq::RetrySet.new.clear
    @applications = Application.all
    json_response(@applications)
  end

  # POST /applications
  def create
    application = ApplicationCreator.new(application_params).execute
   
    json_response(application, :created)
  end

  # GET /applications/:token
  def show
    json_response(@application)
  end

  # PUT /applications/:token
  def update
    @application.update(application_params)
    head :no_content
  end

  # DELETE /applications/:token
  def destroy
    ApplicationDeletor.new(@application).execute
    head :no_content
  end
end
