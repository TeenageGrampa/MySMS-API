class MessagesController < ApplicationController
  # before_action :authenticate_user!
  
  def index
    messages = Message.all.where(user_id: current_user.id)
    render json: messages
  end

  def new
    message = Message.new
  end

  def create
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    message = @client
          .api
          .v2010
          .messages
          .create(
            body: params[:body],
            from: ENV['TWILIO_PHONE_NUMBER'],
            to: params[:to],
            status_callback: 'https://9275fcbfd426.ngrok-free.app/webhooks/twilio'
          )
    if message.error_code.nil?
      @new_message = current_user.messages.new(message_params)
      if @new_message.save
        render json: { status: 'Message sent successfully', message: @new_message }, status: :created
      else
        render json: { status: 'Error', errors: message.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :to, :from, :body)
  end

end
