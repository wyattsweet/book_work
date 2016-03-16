require 'stringio'
require_relative 'decommenter'
string = <<EOM
# This is a comment.
This isn't a comment.
# comment
# another comment
Not a comment
EOM
infile = StringIO.new(string)
outfile = StringIO.new("")
DeCommenter.decomment(infile,outfile)
puts "Test secceeded" if outfile.string == <<EOM
This isn't a comment.
Not a comment.
EOM
puts outfile.string
