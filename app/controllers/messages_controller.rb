class MessagesController < ApplicationController
  def create
    puts '*' * 80
    puts params
    puts '*' * 80
    @message = Message.new(message_params)
    @message.author_id = current_user.id
    @message.conversation_id = params[:conversation_id]
    @message.save
    redirect_to :back
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end