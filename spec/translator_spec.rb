require 'spec_helper'
require './lib/translator'

RSpec.describe Translator do
  let(:translator) { Translator.new("h") }
  let(:translatorplus) { Translator.new("abc") }
  let(:translatorultra) { Translator.new("hi you") }
  let(:translatormagnum) { Translator.new("the quick brown fox jumps over the lazy dog the quick brown fox jumps over the lazy dog") }


  describe "#initialize" do
    it "exists" do
      expect(translator).to be_an_instance_of(Translator)
    end

    it "#attributes" do
      expect(translator.message).to eq("h")
    end
  end

  describe "#valid_chars?" do
    it "takes a string of characters and determines if each contained in dictionary" do
      string1 = Translator.new("Hello")
      string2 = Translator.new("(@#*&")

      expect(translatorultra.valid_chars?).to eq(true)
      expect(string1.valid_chars?).to eq(true)
      expect(string2.valid_chars?).to eq(false)
    end
  end
  
  describe "#valid_message" do
  it "creates a valid message if valid_chars? is true" do
    string1 = Translator.new("Hello")
    string2 = Translator.new("(@#*&")
    
    string1.valid_message
    string2.valid_message
    expect(string1.message).to eq("Hello")
    expect(string2.message).to eq("Please re-enter message using only A-Z keys.")
  end 
end

  describe "#lookup" do
    it "fetches braille version of english letter" do  
      expect(translator.lookup).to eq(["0.\n00\n.."])
    end

    it "fetches braille version of multiple english letters" do
      expect(translatorplus.lookup).to eq(["0.\n..\n..", "0.\n0.\n..", "00\n..\n.."])
    end

    it "converts space characters to :space" do
      expect(translatorultra.lookup).to eq(["0.\n00\n..", ".0\n0.\n..", "..\n..\n..", "00\n.0\n00", "0.\n.0\n0.", "0.\n..\n00"])
    end
  end

  describe "#reformat" do
    it "takes translated letters and breaks them into 3 tiers" do
      translatorultra.lookup
      tier1 =   "0..0..000.0."
      tier2 = "\n000....0.0.."
      tier3 = "\n......000.00"
      expect(translatorultra.reformat).to eq([tier1, tier2, tier3])
    end
  end

  describe "#translate" do
    it "takes new translated strings and joins them together" do
      expect(translatorultra.translate).to eq("0..0..000.0.\n000....0.0..\n......000.00")
    end
  end


  describe "#text_wrap" do
    it "takes the translated message and splits every 80 characters" do
      long_line = Translator.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(long_line.message.length).to eq(85)
      expect(long_line.text_wrap).to eq("0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n\n0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n\n0.0.0.0.0.\n..........\n..........")
    end
  end

end

    # --------------------------- TEXT WRAPPING ---------------------------
    # it "#split_40 - puts translated letters into a new array every 40 chars" do
    #   long_line = Translator.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    #   expect(long_line.message.length).to eq(85)
    #   long_line.lookup
    #   line1 = ["0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n.."]
    #   line2 = ["0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n.."]
    #   line3 = ["0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n..", "0.\n..\n.."]
    #   expect(long_line.split_40).to eq([line1, line2, line3])
    # end

    # it "takes array groups and breaks into 3 tiers of strings per letter" do
    #   long_line = Translator.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    #   long_line.lookup
    #   long_line.split_40
    #   expect(long_line.reformat).to eq("0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n\n0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n\n0.0.0.0.0.\n..........\n..........")
    # end

    # Pseudocode:
    # (#split_40 started in translator.rb)
    # instead of wrapping at the end after characters have already been put together, 
    # splits up each character into groups of 40
    # loops through each group and puts every letter up to 40 - top tier in the string first, \n, middle, \n, bottom
    # then separates the next group of 40 with \n\n and does the same
    # separates following groups the same until the array of all groups is empty

    # Code is currently working as is, and both translate functions would need to be re-written in order to do this
