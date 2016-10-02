f = Fiber.new do
  puts "Hi."
  Fiber.yield
  puts "Nice day"
  Fiber.yield
  puts "Bye!"
end
f.resume
puts "Back to the fiber:"
f.resume
puts "one last message from fiber"
f.resume
puts "That's all!"


