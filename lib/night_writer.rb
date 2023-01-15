require_relative './translator'

handle = File.open(ARGV[0], "r")

english_message = handle.read
handle.close

puts "Created #{}"
# puts english_message

incoming = Translator.new(english_message).translate_letter(english_message)


night_writer_file = File.open(ARGV[1], "w")
night_writer_file.write(incoming)
night_writer_file.close
