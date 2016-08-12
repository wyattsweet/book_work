a = Thread.new { puts "a"; Thread.stop; puts "c" }

sleep 0.1 while a.status != 'sleep'

puts "Got Here"

a.run 

a.join
