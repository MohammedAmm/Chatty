module ApplicationC
    module Initialize
        extend ActiveSupport::Concern

        included do
            before_action :set_application, only: [:show, :update, :destroy]
        end  

        private
        
        def set_application
            @application = Application.find_by!(token: params[:token])
        end
        
        def application_params
          params.required(:name)
          # whitelist params
          params.permit(:name)
        end
    end
end