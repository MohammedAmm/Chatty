module ChatC
    module Relate
        extend ActiveSupport::Concern

        included do
            before_action :set_application_chat
        end  

        private

        def chat_params
          params.require(:title)
          params.permit(:title)
        end
      
        def set_application_chat
          @chat = @application.chats.find_by!(number: params[:chat_number]) if @application
        end
    end
end