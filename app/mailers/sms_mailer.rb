class SmsMailer < ActionMailer::Base
  default from: 'vallejo.reminders@gmail.com'

  def rent_email
    @email = params[:email]
    mail(to: @email, subject: 'Pay rent')
  end

  def garbage_email
    @email = params[:email]
    mail(to: @email, subject: 'Take out trash')
  end
end
