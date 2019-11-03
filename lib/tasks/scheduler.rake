desc "This task is called by the Heroku scheduler add-on"
task :send_reminders => :environment do
  require "#{Rails.root}/app/jobs/send_reminders_job"
  SendRemindersJob.new.perform
end
