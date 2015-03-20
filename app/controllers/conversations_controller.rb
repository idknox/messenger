class ConversationsController < ApplicationController
  def new
    @recipients = User.where('id <> ?', current_user.id).map {|user| user.name }
    @message = Message.new
  end

  def create
    puts '*' * 80
    puts params
    puts '*' * 80
    receiver = User.find_by(name: params[:message][:conversation][:receiver])
    conversation = Conversation.create
    UserConversation.create(user_id: current_user.id, conversation_id: conversation.id)
    UserConversation.create(user_id: receiver.id, conversation_id: conversation.id)
    @message = Message.new(body: params[:message][:body], conversation_id: conversation.id, author_id: current_user.id)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

end
