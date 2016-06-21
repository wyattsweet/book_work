module TextHandler
  class InvalidLineError < StandardError
  end
end  

def line_from_file(filename, substring)
  fh = File.open(filename)
  line = fh.gets
  raise TextHandler::InvalidLineError unless line.include?(substring)
  return line

  rescue InvalidLineError
    puts "Invalid line!"
    raise
  ensure
    fh.close
end

line_from_file("datafile", "lalala")
