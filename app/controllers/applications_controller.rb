class ApplicationsController < MainApplicationController
  include ApplicationC::Initialize

  # GET /applications
  def index
    @applications = Application.all
    json_response(@applications)
  end

  # POST /applications
  def create
    @application = Application.create!(application_params)
    json_response(@application, :created)
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
    @application.destroy
    head :no_content
  end
end
