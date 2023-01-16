# ruby ./lib/night_reader.rb braille.txt original_message.txt

require_relative './reverter'

braille_file = File.open(ARGV[0], "r")
message = braille_file.read.strip

reverter = Reverter.new(message)
reverted_message = reverter.revert

output = File.open(ARGV[1], "w")
output.write(reverted_message)

puts "Created '#{ARGV[1]}' containing #{reverted_message.length} characters"