# require 'spec_helper'
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

  describe '#translate' do
    it "#translate - english letter to braille" do  
      expect(translator.translate).to eq("0.\n00\n..")
    end
  end

end