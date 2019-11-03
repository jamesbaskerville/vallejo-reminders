class SendRemindersJob < ApplicationJob
  SMS_CLIENT_YAML_PATH = "#{Rails.root}/config/sms.yml".freeze

  def perform
    time = Time.current

    send_garbage_message if true
    send_rent_message if true
  end

  private

  def is_monday?(time)
    time.strftime('%A') === "Monday"
  end

  def is_first_of_month?(time)
    time.strftime('%d') === "01"
  end

  def send_rent_message
    email = SMSEasy::Client.sms_address(Figaro.env.my_number, "at&t")
    SmsMailer.with(email: email).rent_email.deliver_now
  end

  def send_garbage_message
    email = SMSEasy::Client.sms_address(Figaro.env.my_number, "at&t")
    SmsMailer.with(email: email).garbage_email.deliver_now
  end
end
