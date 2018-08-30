class ConversationsController < ApplicationController

  def index
    @conversations = current_user.conversations
  end

  def new
    @conversation = Conversation.new
    render layouts: false
  end

  def create
    @conversation = Conversation.new(conversation_params)

    @conversation.conversations_users_attributes = [{user_id: current_user.id},{user_id: params[:conversation][:recipient_id]}]
    @conversation.messages_attributes = [{text: params[:conversation][:message], user: current_user}]

    if @conversation.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end




    # respond_to do |format|
    #   if @chat.save
    #     format.html { redirect_to @chat, notice: 'Message was successfully posted.' }
    #     format.json { render :show, status: :created, location: @chat }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @chat.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def show

    @conversation = Conversation.find(params[:id])
    # @conversations = Conversation.all
    # @conversations = Conversation.joins(:conversations_users).where(conversations_users: {user: current_user} )

  end

  private
  def conversation_params
    params.require(:conversation).permit(
      :subject
    )
  end

end
