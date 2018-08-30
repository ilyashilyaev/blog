class MessagesController < ApplicationController


  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages =  @conversation.messages
  end

  def create

    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.new(message_params)
    @message.user = current_user
    puts('=============')
    puts @message.inspect
    if @message.save
      render json: @message
    else
      respond_with @message
    end
  end

  def show
    @message = Message.find(params[:id])
  end




  private

  def message_params
    params.require(:message).permit(:text)
  end

end
