require_relative './revert_dictionary'

class Reverter
  include RevertDictionary
  attr_reader :braille
  def initialize(braille)
    @braille = braille
  end

  def revert
    DICTIONARY[@braille]
  end
end