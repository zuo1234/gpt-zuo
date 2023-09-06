class Message < ApplicationRecord
  enum role: {
    user: 0,
    assistant: 1
  }
  belongs_to :chat

  enum status: {
    pending: 0,
    completed: 1,
    failed: 2
  }

  broadcasts_to ->(message) { [ message.chat, "messages" ] }, inserts_by: :prepend
end
