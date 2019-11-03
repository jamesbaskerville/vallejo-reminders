class SendRemindersJob < ApplicationJob
  SMS_CLIENT_YAML_PATH = "#{Rails.root}/config/sms.yml".freeze

  RENT_MESSAGE = "Don't forget to pay rent today!"
  TRASH_MESSAGE = "Remember to take out the trash!"

  def perform
    time = Time.current

    send_message(TRASH_MESSAGE) if true
    send_message(RENT_MESSAGE) if true
  end

  private

  def is_monday?(time)
    time.strftime('%A') === "Monday"
  end

  def is_first_of_month?(time)
    time.strftime('%d') === "01"
  end

  def send_message(message)
    sms_client.deliver(Figaro.env.my_number, "at&t", message)
  end

  def sms_client
    @sms_client ||= begin
      SMSEasy::Client.config['from_address'] = "noreply@example.com"
      SMSEasy::Client.new
    end
  end
end
