class MessagesController < ApplicationController

  def create
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio

    sms = @client.messages.create(
    from: Rails.application.secrets.twilio_number,
    to: from_number,
    body: "Hello there, thanks for texting me. Your number is #{from_number}."
  )
  end

  def reply
     client = Twilio::REST::Client.new Rails.application.secrets.PN0d8b9f8b8a9ba586ed6878aeb21f9d88, Rails.application.secrets.9ee47e555c59ff5c3b8adbd8f631374f
     message = client.messages.create from: '+61428257903', to: '+0416404185', body: 'First ever MyMedy notifcation test.'
     render plain: message.status
   end

  private

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
