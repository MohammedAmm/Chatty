module Messagable
    module Initialize
        extend ActiveSupport::Concern

        included do
            before_action :set_chat_message, only: [:show, :update, :destroy]
        end  

        private
  
        def message_params
          params.require(:body)
          params.permit(:body)
        end
      
        def set_chat_message
          @message = @chat.messages.find_by!(number: params[:number]) if @chat
        end
    end
end