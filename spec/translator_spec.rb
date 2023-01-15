require 'spec_helper'
require './lib/translator'

RSpec.describe Translator do
  let(:translator) { Translator.new("h") }

  describe "#initialize" do
    it "exists" do
      expect(translator).to be_an_instance_of(Translator)
    end

    it "#attributes" do
      expect(translator.message).to eq("h")
    end
  end

  describe "#translate_letter" do
    it "translates english letter to braille" do  
      expect(translator.translate_letter("h")).to eq("0.\n00\n..")
    end
  end
end