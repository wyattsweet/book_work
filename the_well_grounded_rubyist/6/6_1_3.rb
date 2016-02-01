#print "exit the program? (yes or no): "
#answer = gets.chomp
#case answer
#when "yes"
#  puts "Good-bye!"
#  exit
#when "no"
#  puts "OK, we'll contine"
#else
#  puts "That's an unknown answer -- assuming you meant 'no'
#  "
#  exit
#end
# puts "continuing with program..."

class Ticket
	attr_accessor :venue, :date
	def initialize(venue, date)
		self.venue = venue
		self.date = date
	end

	def ===(other_ticket)
		self.venue == other_ticket.venue
	end
end
#ticket1 = Ticket.new("Town Hall", "07/08")
#ticket2 = Ticket.new("conference center", "07/08")
#ticket3 = Ticket.new("Town Hall", "08/09")
#
#case ticket1
#when ticket2
#  puts "Same location as ticket2!"
#when ticket3
#	puts "Same location as ticket3"
#else
#	puts "No match"
#end
#

class Person
	attr_accessor :first_name, :last_name

	def initialize(first, last)
		self.first_name = first
		self.last_name = last
	end
end

