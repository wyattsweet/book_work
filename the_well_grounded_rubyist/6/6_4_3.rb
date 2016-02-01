def fussy_method(x)
  raise ArgumentError, "I need a number under 10" unless x < 10
end

begin    
  fussy_method(10)
rescue ArgumentError => e
  puts "that was not an exceptable answer"
  puts "Here's the backtrace for this exception:"
  puts e.backtrace
  puts "And here's the exception object's message:"
  puts e.message
end
