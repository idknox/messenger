class DashboardController < ApplicationController
  def show
    @conversation = Conversation.new
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @message = Message.new
  end
end