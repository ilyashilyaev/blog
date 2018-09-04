class MessagesController < ApplicationController


  def index
    @conversation = Conversation.find(params[:conversation_id])
    # @message =  @conversation.messages

    @messages = @conversation.messages.order(id: :desc).page(params[:page])
    # Conversation.message.paginate(:page => params[:page], :per_page =>10)

  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.new(message_params)
    @message.user = current_user
    if @message.save
      render json: @message
    else
      respond_with @message
    end
  end

  def edit
    @conversation = Conversation.find(params[:conversation_id])
    @message      = Message.find(params[:id])
    render layout: false
  end

  def update

    @message = Message.find(params[:id])
    if @message.update(message_params)
      # render json: @message
      respond_with @message
    else
      respond_with @message
    end

  end


  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_with do |format|
      format.json { render json: @message }
    end
  end


  private

  def message_params
    params.require(:message).permit(:text)
  end

end
