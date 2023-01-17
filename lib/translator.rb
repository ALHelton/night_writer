require_relative './dictionary'

class Translator
include Dictionary
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def valid_chars?
    @message.chars.each do |char|
      if ('a'..'z').include?(char.downcase)
        return true
      else
        return false
      end
    end
  end

  def valid_message
    if valid_chars? != true
      @message = "Please re-enter message using only A-Z keys."
    end
  end

  # def text_wrap
  #   remaining = []
  #   @message.chars.each_slice(80) do |slice|
  #     require 'pry'; binding.pry
  #   end
  # end


  def lookup
    @message.chars.map do |character|
      if character == " "
        DICTIONARY[:space]
      else
        DICTIONARY[character.downcase.to_sym]
      end
    end
  end

  def split_40
    nested_letters = lookup.combination(1).to_a
    letter_groups = []
    nested_letters.each_slice(40) do |group_40|
      letter_groups << group_40.flatten
    end
    require 'pry'; binding.pry
    letter_groups

  end



  def reformat
    tier1 = [].join
    tier2 = [].join.concat("\n")
    tier3 = [].join.concat("\n")
    lookup.map do |letter|
      divided = letter.split("\n")
      # require 'pry'; binding.pry
      
      # range count (0..80)
      #looping until empty?
      
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

  # def text_wrap
  #   remaining = []
  #   translate.chars.each_with_index do |char, index|
  #     if index < 240
  #       remaining << char
  #     else
  #       # require 'pry'; binding.pry
  #     end
  #   end
    # translate.chars.each do |character|
    #   require 'pry'; binding.pry
    #   if translate.chars.index(character) == 240
    #     # translate.chars
    #   end
    # end



    # if char_count > 240

    #   require 'pry'; binding.pry
    # end

  # end
end