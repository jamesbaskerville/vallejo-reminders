ActionMailer::Base.smtp_settings = {
  domain:         'vallejoreminders.com',
  address:        "smtp.sendgrid.net",
  port:            587,
  authentication: :plain,
  user_name:      'apikey',
  password:       Figaro.env.sendgrid_api_key
}
