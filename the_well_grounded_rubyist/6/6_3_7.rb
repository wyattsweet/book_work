# implenting .map iterator

class Array
	def my_map
		c = 0
		accu = []
		until c == size
			accu << yield(self[c])
			c += 1
		end
		accu
	end
end

array = ["bill", "steve", "mike"]
array.my_map {|name| name.upcase}
