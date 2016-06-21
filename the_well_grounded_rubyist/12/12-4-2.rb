# Query directories

newdir = "/Users/wsweet/dev/book_work/the_well_grounded_rubyist/12/newdir"
newfile = "newfile"

Dir.mkdir(newdir)
Dir.chdir(newdir) do
  File.open(newfile, "w") do |f|
    f.puts "Sample file in new directory"
  end
  puts "Current directory: #{Dir.pwd}"
  puts "Directory listing: "
  p Dir.entries(".")
  #File.unlink(newfile)
end
Dir.rmdir(newdir)
print "Does #{newdir} still exist? "
if File.exists?(newdir)
  puts "yes"
else
  puts "No"
end
