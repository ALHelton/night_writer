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

  def reorder
    tier1 = [].join("")
    tier2 = [].join("")
    tier3 = [].join("")
    translate.map do |letter|
      divided = letter.split("\n")
      tier1 << divided[0]
      tier2 << divided[1]
      tier3 << divided[2] 
    end
    all_tiers = []
    all_tiers << tier1
    all_tiers << tier2
    all_tiers << tier3
    all_tiers
  end
end