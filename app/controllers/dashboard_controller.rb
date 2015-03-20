class DashboardController < ApplicationController
  def show
    @conversations = UserConversation.where(user_id: current_user.id)
    @message = Message.new
  end
end