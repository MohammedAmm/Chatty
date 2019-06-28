module ApplicationC
    module Relate
        extend ActiveSupport::Concern

        included do
            before_action :set_application
        end  

        private
        
        def set_application
            @application = Application.find_by!(token: params[:application_token])
        end
    end
end