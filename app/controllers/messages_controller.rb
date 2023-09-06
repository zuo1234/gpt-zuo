class MessagesController < ApplicationController

  def create
    @chat = Chat.find params[:chat_id]
    @message = @chat.messages.create message_params
    ProcessMessageJob.perform_later(@message)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
