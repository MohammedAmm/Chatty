class MessagesController < MainApplicationController
    include ApplicationC::Relate
    include ChatC::Relate
    include MessageC::Initialize
  
    # GET /applications/:application_token/chats/:chat_number/messages
    def index
      json_response(@chat.messages)
    end
  
    # GET /applications/:application_token/chats/:chat_number/messages/:number
    def show
      json_response(@message)
    end
  
    # POST /applications/:application_token/chats/:chat_number/messages
    def create
      message_number =  MessageCreator.new(@chat).execute(message_params)
      json_response({status: 'success',number: message_number}, :created)
    end
  
    # PUT /applications/:application_token/chats/:chat_number/messages/:number
    def update
      @message.update(message_params)
      head :no_content
    end
  
    # DELETE /applications/:application_token/chats/:chat_number/messages/:number
    def destroy
      MessageDeletor.new(@message).execute(@chat)     
      head :no_content
    end

    #Search for messages
    def search
      json_response(Message.search params[:body], where: {chat_id: @chat.id})
    end
end
