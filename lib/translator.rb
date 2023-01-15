require_relative './dictionary'

class Translator
include Dictionary
  attr_reader :message
  def initialize(message)
    @message = message
  end

  def translate_letter(message)
    # require 'pry'; binding.pry
    DICTIONARY[message.downcase.to_sym]
  end
  
end