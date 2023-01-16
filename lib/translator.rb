require_relative './dictionary'

class Translator
include Dictionary
  attr_reader :message
  def initialize(message)
    @message = message
  end

  def translate
    @message.chars.map do |character|
      if character == " "
        DICTIONARY[:space]
      else
        DICTIONARY[character.to_sym]
      end
    end
  end

  # def translate
  #   translated = @message.chars.map do |character|
  #     if character == " "
  #       DICTIONARY[:space].split("\n")
  #     else
  #       DICTIONARY[character.to_sym].split("\n")
  #       require 'pry'; binding.pry
  #     end

  #     tier1 = translated[0]
  #     tier2 = translated[1]
  #     tier3 = translated[2]
  #   end



  # end

end