class ProcessMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    response_message = message.chat.messages.new role: "assistant"

    # client = OpenAI::Client.new

    # response_message.response = client.chat(
    #   parameters: {
    #       model: "gpt-3.5-turbo", # Required.
    #       messages: message.chat.messages.where("id <= ?", message.id).map { |message|
    #         { role: message.role, content: message.content }
    #       }, # Required.
    #   }
    # )

    # if response_message.response["error"]
    #   response_message.failed!
    # else
    #   response_message.content = response_message.response.dig("choices", 0, "message", "content")
    #   response_message.completed!
    # end
    response_message.content = "回复"
    response_message.completed!
  end
end