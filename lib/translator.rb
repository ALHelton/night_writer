require_relative './dictionary'

class Translator
include Dictionary
  attr_reader :message
  def initialize(message)
    @message = message
  end

  def lookup
    @message.chars.map do |character|
      if character == " "
        DICTIONARY[:space]
      else
        DICTIONARY[character.to_sym]
      end
    end
  end

  def reformat
    tier1 = [].join
    tier2 = [].join.concat("\n")
    tier3 = [].join.concat("\n")
    lookup.map do |letter|
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
  
  def translate
    reformat.join
  end

  def text_wrap
    require 'pry'; binding.pry
    # translate.chars.each do |character|
    #   require 'pry'; binding.pry
    #   if translate.chars.index(character) == 240
    #     # translate.chars
    #   end
    # end



    # if char_count > 240

    #   require 'pry'; binding.pry
    # end

  end
end