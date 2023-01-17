require_relative './revert_dictionary'

class Reverter
  include RevertDictionary
  attr_reader :braille
  def initialize(braille)
    @braille = braille
    # require 'pry'; binding.pry
  end

  def lookup_format
    divided = @braille.split("\n")
    nested_groups = divided.combination(1).to_a

    whole_letters = nested_groups.flat_map do |group|
      line_groups = group.map do |string|
        string.scan(/.{2}/)
      end
    end.transpose

    lookup_letters = []
    
    whole_letters.each do |letter|
      lookup_letters << letter.join("\n")
    end
    lookup_letters
  end


  # def revert
  #   formatted_letters.map do |letter|
  #     DICTIONARY[letter]
  #   end.join("")
  # end

  # def formatted_letters
  #   single_letters = []
  #   until @braille.empty?
  #     single_letters << @braille.slice!(0...9)
  #   end

  #   formatted_letters = single_letters.map do |letter|
  #     if letter.size > 8
  #       letter.chop
  #     else
  #       letter
  #     end
  #   end
  # end

end