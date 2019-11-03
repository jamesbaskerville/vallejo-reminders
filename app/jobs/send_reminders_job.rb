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

  def numbers
    @numbers ||= Rails.application.credentials.dig(:numbers)
  end

  def send_rent_message
    numbers.each do |number|
      email = SMSEasy::Client.sms_address(number.to_s, "at&t")
      SmsMailer.with(email: email).rent_email.deliver_now
    end
  end

  def send_garbage_message
    numbers.each do |number|
      email = SMSEasy::Client.sms_address(number.to_s, "at&t")
      SmsMailer.with(email: email).garbage_email.deliver_now
    end
  end
end
