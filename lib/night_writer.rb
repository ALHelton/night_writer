require_relative './translator'

input_file = File.open(ARGV[0], "r")
message = input_file.read.strip

translated = Translator.new(message)
translated_message = translated.translate

output = File.open(ARGV[1], "w")
output.write(translated_message)

puts "Created '#{ARGV[1]}' containing #{message.length} characters"