print "exit the program? (yes or no): "
answer = gets.chomp
case answer
when "yes"
  puts "Good-bye!"
  exit
when "no"
  puts "OK, we'll contine"
else
  puts "That's an unknown answer -- assuming you meant 'no'
  "
  exit
end
puts "continuing with program..."
