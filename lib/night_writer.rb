handle = File.open(ARGV[0], "r")

incoming_text = handle.read
handle.close

# puts incoming_text

reversed = incoming_text.reverse
writer = File.open(ARGV[1], "w")
writer.write(reversed)
writer.close
