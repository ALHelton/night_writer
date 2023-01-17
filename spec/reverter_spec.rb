require 'spec_helper'
require './lib/reverter'

RSpec.describe Reverter do
  let(:reverter) { Reverter.new("0.\n00\n..") }
  let(:reverterplus) { Reverter.new("0.0.0000\n..0....0\n........") }
  let(:reverterultra) { Reverter.new("0..0..000.0.\n000....0.0..\n......000.00") }

  describe "#initialize" do
    it "exists" do
      expect(reverter).to be_an_instance_of(Reverter)
    end

    it "attributes" do
      expect(reverter.braille).to eq("0.\n00\n..")
    end
  end

  describe "#lookup_format" do
    it "translates a single Braille letter to dictionary format" do
      h = ["0.\n00\n.."]
      expect(reverter.lookup_format).to eq(h)
    end

    it "translates multiple Braille letters/words to dictionary format" do
      abcd = ["0.\n..\n..", "0.\n0.\n..", "00\n..\n..", "00\n.0\n.."]
      expect(reverterplus.lookup_format).to eq(abcd)
    end
  end

  describe "#revert" do
    it "matches braille to english characters" do
      expect(reverterultra.revert).to eq("hi")
    end
  end
end