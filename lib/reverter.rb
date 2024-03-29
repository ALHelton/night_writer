require_relative './revert_dictionary'

class Reverter
  include RevertDictionary
  attr_reader :braille
  def initialize(braille)
    @braille = braille
  end

  def lookup_format

    divided = @braille.strip.split("\n")
    nested_groups = divided.combination(1).to_a
    
    whole_letters = nested_groups.flat_map do |group|
      line_groups = group.map do |string|
        string.scan(/.{2}/)
      end

    end.reject(&:empty?).transpose
    
    lookup_letters = []
    whole_letters.each do |letter|
      lookup_letters << letter.join
    end
    lookup_letters
  end
  
  def revert
    lookup_format.map do |character|
      DICTIONARY[character]
    end.join
  end
end