class NotificationsControllerController < ApplicationController

  rescue_from StandardError do |exception|
    trigger_sms_alerts(exception)
  end

  def trigger_sms_alerts(e)
    @alert_message = "
      [This is a test]"
    @image_url = "https://openclipart.org/image/2400px/svg_to_png/219291/1432299223.png"

    @admin_list = YAML.load_file('config/administrators.yml')

   begin
     @admin_list.each do |admin|
       phone_number = admin['phone_number']
       send_message(phone_number, @alert_message, @image_url)
     end

   private

   def send_message(phone_number, alert_message, image_url)

    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => phone_number,
      :body => alert_message,
    )
    puts message.to
  end

  def send_message(phone_number, alert_message, image_url)

    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

end
