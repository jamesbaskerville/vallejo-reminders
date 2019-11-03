desc "This task is called by the Heroku scheduler add-on"
task :send_garbage_reminder => :environment do
  puts "Sending garbage reminder..."
  sleep(2)
  puts "done."
end

task :send_rent_reminder => :environment do
  puts "Sending garbage reminder..."
  sleep(2)
  puts "done."
end
