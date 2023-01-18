require 'spec_helper'
require './lib/reverter'

RSpec.describe Reverter do
  let(:reverter) { Reverter.new("0.\n00\n..\n\n") }
  let(:reverterplus) { Reverter.new("0.0.0000\n..0....0\n........\n\n") }
  let(:reverterultra) { Reverter.new("0..0..000.0.\n000....0.0..\n......000.00\n\n") }

  describe "#initialize" do
    it "exists" do
      expect(reverter).to be_an_instance_of(Reverter)
    end

    it "attributes" do
      expect(reverter.braille).to eq("0.\n00\n..\n\n")
    end
  end

  describe "#lookup_format" do
    it "translates a single Braille letter to dictionary format" do
      h = ["0.00.."]
      expect(reverter.lookup_format).to eq(h)
    end

    it "translates multiple Braille letters/words to dictionary format" do
      abcd = ["0.....", "0.0...", "00....", "00.0.."]
      expect(reverterplus.lookup_format).to eq(abcd)
    end
  end

  describe "#revert" do
    it "matches braille to english characters" do
      expect(reverterultra.revert).to eq("hi you")
    end
  end
end