class ChatsController < MainApplicationController
  include ApplicationC::Relate
  include ChatC::Initialize


  # GET /applications/:application_token/chats
  def index
    json_response(@application.chats)
  end

  # GET /applications/:application_token/chats/:number
  def show
    json_response(@chat)
  end

  # POST /applications/:application_token/chats
  def create
    chat_number = ChatCreator.new(@application).execute(chat_params)
    
    json_response({status: 'success',number: chat_number}, :created)
  end

  # PUT /applications/:application_token/chats/:number
  def update
    @chat.update(chat_params)
    head :no_content
  end

  # DELETE /applications/:application_token/chats/:number
  def destroy
    @chat.destroy
    RedisHandler.new('application',@application.id).decrement
    head :no_content
  end
end
