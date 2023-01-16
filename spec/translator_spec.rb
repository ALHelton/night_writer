require 'spec_helper'
require './lib/translator'

RSpec.describe Translator do
  let(:translator) { Translator.new("h") }
  let(:translatorplus) { Translator.new("abc") }
  let(:translatorultra) { Translator.new("hi you") }
  let(:translatormagnum) { Translator.new("the quick brown fox jumps over the lazy dog") }

  describe "#initialize" do
    it "exists" do
      expect(translator).to be_an_instance_of(Translator)
    end

    it "#attributes" do
      expect(translator.message).to eq("h")
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
    xit "takes formatted text and sends it to a new line after 80 characters" do
      translatormagnum.text_wrap

      firstlines = ".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..\n0000.0..00..0.......0.00.000.0..0..0....00....0.0....00..000..0000.0..0....0.0..\n0.......0.00....0.....0.0..00.....0.00....000.0.0...0.00..0...0.......0...0000..\n\n"
      secondlines = "000.00\n.0.000\n..0..."

      expect(translatormagnum.translate).to eq([firstlines, secondlines])
    end
  end

end