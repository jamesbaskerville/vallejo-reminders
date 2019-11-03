class SendRemindersJob < ApplicationJob
  def perform
    time = Time.current

    # Send garbage message every day to test heroku
    send_garbage_message
    send_rent_message if is_first_of_month?(time)
  end

  private

  def is_monday?(time)
    time.strftime('%A') === "Monday"
  end

  def is_first_of_month?(time)
    time.strftime('%d') === "01"
  end

  def send_rent_message
    email = SMSEasy::Client.sms_address(Rails.application.credentials.dig(:my_number), "at&t")
    SmsMailer.with(email: email).rent_email.deliver_now
  end

  def send_garbage_message
    email = SMSEasy::Client.sms_address(Rails.application.credentials.dig(:my_number), "at&t")
    SmsMailer.with(email: email).garbage_email.deliver_now
  end
end
