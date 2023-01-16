# ruby lib/night_writer.rb message.txt braille.txt

require_relative './translator'

input_file = File.open(ARGV[0], "r")
message = input_file.read.strip

translator = Translator.new(message)
translated_message = translator.translate

output = File.open(ARGV[1], "w")
output.write(translated_message)

puts "Created '#{ARGV[1]}' containing #{message.length} characters"