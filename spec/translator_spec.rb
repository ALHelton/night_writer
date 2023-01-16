require 'spec_helper'
require './lib/translator'

RSpec.describe Translator do
  let(:translator) { Translator.new("h") }
  let(:translatorplus) { Translator.new("abc") }
  let(:translatorultra) { Translator.new("hi you") }

  describe "#initialize" do
    it "exists" do
      expect(translator).to be_an_instance_of(Translator)
    end

    it "#attributes" do
      expect(translator.message).to eq("h")
    end
  end

  describe "#translate" do
    it "translates english letter to braille" do  
      expect(translator.translate).to eq(["0.\n00\n.."])
    end

    it "translates multiple english letters to braille" do
      expect(translatorplus.translate).to eq(["0.\n..\n..", "0.\n0.\n..", "00\n..\n.."])
    end

    it "converts space characters to :space" do
      expect(translatorultra.translate).to eq(["0.\n00\n..", ".0\n0.\n..", "..\n..\n..", "00\n.0\n00", "0.\n.0\n0.", "0.\n..\n00"])
    end
  end

  describe "#reformat" do
    it "takes translated letters and breaks them into 3 tiers" do
      translatorultra.translate

      tier1 =   "0..0..000.0."
      tier2 = "\n000....0.0.."
      tier3 = "\n......000.00"
      expect(translatorultra.reformat).to eq([tier1, tier2, tier3])
    end
  end

end