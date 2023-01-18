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

  def lookup
    @message.chars.map do |character|
      if character == " "
        DICTIONARY[:space]
      else
        DICTIONARY[character.downcase.to_sym]
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
    text_wrap
  end

  def text_wrap
    top_tiers = []
    middle_tiers = []
    bottom_tiers = []
    reformat[0].chomp.scan(/.{2}/).each_slice(40) do |group_40|
      top_tiers << group_40.join
    end
    reformat[1].chomp.scan(/.{2}/).each_slice(40) do |group_40|
      middle_tiers << group_40.join
    end
    reformat[2].chomp.scan(/.{2}/).each_slice(40) do |group_40|
      bottom_tiers << group_40.join
    end
    all_tiers = []
    all_tiers << top_tiers
    all_tiers << middle_tiers
    all_tiers << bottom_tiers
    
    formatted_tiers = all_tiers.transpose
    
    newline_tiers = formatted_tiers.map do |line|
      new_tiers = line.map do |tier|
        tier + "\n"
      end
      new_tiers.join + "\n"
    end
    newline_tiers.join
  end
end