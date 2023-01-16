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

  describe '#translate' do
    it "translates english letter to braille" do  
      expect(translator.translate).to eq("0.\n00\n..")
    end

    it "translates multiple english letters to braille" do
      expect(translatorplus.translate).to eq("0.\n..\n..\n0.\n0.\n..\n00\n..\n..")
    end

    it "#space_converter" do
      translatorultra.space_converter
      expect(translatorultra.translate).to eq("0.\n00\n..\n.0\n0.\n..\n..\n..\n..\n00\n.0\n00\n0.\n.0\n0.\n0.\n..\n00")
    end
  end

end