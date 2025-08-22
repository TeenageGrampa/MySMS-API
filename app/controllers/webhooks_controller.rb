class WebhooksController < ApplicationController
  def message_status
    message_sid = params[:MessageSid]
    message_status = params[:MessageStatus]

    case message_status
    when 'delivered'
      payload  = { message: message_sid , status: 'delivered', type: 'update' }
      ActionCable.server.broadcast("message_status_channel", payload.to_json)
    when 'failed'
      puts "Message #{message_sid} failed with error: #{params[:ErrorCode]}"
    end

    head :ok
  end
end
