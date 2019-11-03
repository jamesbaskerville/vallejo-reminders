desc "This task is called by the Heroku scheduler add-on"
task :send_reminders => :environment do
  time = Time.current
  puts "Current time: " + time.to_formatted_s(:rfc822)
  if time.strftime('%A') === "Monday"
    puts "Sending garbage reminder..."
    sleep(1)
    puts "done."
  end

  if time.strftime('%d') === "01"
    puts "Sending rent reminder..."
    sleep(1)
    puts "done."
  end
end
