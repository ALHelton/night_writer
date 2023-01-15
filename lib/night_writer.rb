require_relative './translator'

message_file = ARGV[0]
created_file = ARGV[1]

handle = File.open(ARGV[0], "r")

incoming_text = handle.read
handle.close

incoming = Translator.new(incoming_text).translate_letter(incoming_text)

writer = File.open(ARGV[1], "w")
writer.write(incoming)
writer.close

puts "Created '#{created_file}' containing #{incoming.length} characters"