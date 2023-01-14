require_relative './translator'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read
handle.close

# puts incoming_text

incoming = Translator.new(incoming_text).translate_letter(incoming_text)


writer = File.open(ARGV[1], "w")
writer.write(incoming)
writer.close
