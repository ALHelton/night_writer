require_relative './dictionary'

class Translator
include Dictionary
  attr_reader :message
  def initialize(message)
    @message = message
  end

  def translate
    # require 'pry'; binding.pry
    DICTIONARY[@message.downcase.to_sym]
  end  

end