class MessageStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_status_channel"
  end

  def unsubscribed
  end
end
