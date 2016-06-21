require 'logger'

#print "Enter a number: "
#n = gets.to_i
#begin
#	result = 100 / n
#rescue
#	puts "Your num didn't work. Was it zero???"
#	exit
#end
#
#puts "100/#{n} is #{result}"

def open_user_file
	print "File to open: "
	filename = gets.chomp
	begin
	  fh = File.open(filename)
	rescue => e  
          puts "user tried to open #{filename}, #{Time.now}")
          puts "Exception: #{e.message}"
	  puts "Couldn't open your file."
	  return
        end
	yield fh
	fh.close
end

open_user_file
