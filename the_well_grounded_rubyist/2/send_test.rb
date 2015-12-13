ticket = Object.new

def ticket.venue
	"Shoreline Ampitheatre"
end

puts ticket.venue

print "Information desired:"
request = gets.chomp

if ticket.respond_to? (request)
	puts ticket.send(request)
else
	puts "No such information available"
end
