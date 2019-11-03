class SmsMailer < ActionMailer::Base
  default from: '1530@vallejo.com'

  def rent_email
    @email = params[:email]
    mail(to: @email, subject: 'Pay rent')
  end

  def garbage_email
    @email = params[:email]
    mail(to: @email, subject: 'Take out trash')
  end
end
