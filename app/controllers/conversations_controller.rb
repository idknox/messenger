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
    conversation = Conversation.new(sender_id: current_user.id, receiver_id: receiver.id)
    conversation.save
    @message = Message.new(body: params[:message][:body], conversation_id: conversation.id, author_id: current_user.id)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

end
