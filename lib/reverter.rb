require_relative './revert_dictionary'

class Reverter
  include RevertDictionary
  attr_reader :braille
  def initialize(braille)
    @braille = braille
  end

  def revert
    single_letters = []
    until @braille.empty?
      single_letters << @braille.slice!(0...9)
    end

    formatted_letters = []
    single_letters.each do |letter|
      if letter.size > 8
        formatted_letters << letter.chop
      else
        formatted_letters << letter
      end
    end

    formatted_letters.map do |letter|
      DICTIONARY[letter]
    end.join("")
  end

end