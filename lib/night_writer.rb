require_relative './translator'

input_file = File.open(ARGV[0], "r")
message = input_file.read.strip

translated = Translator.new(message).translate(message)

output = File.open(ARGV[1], "w")
output.write(translated)

puts "Created '#{ARGV[1]}' containing #{message.length} characters"