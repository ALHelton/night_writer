require_relative './dictionary'

class Translator
include Dictionary
  attr_reader :message
  def initialize(message)
    @message = message
  end

  def translate
    @message.chars.map do |character|
      DICTIONARY[character.to_sym]
    end.join("\n")
  end

end