require 'spec_helper'
require './lib/reverter'

RSpec.describe Reverter do
  let(:reverter) { Reverter.new("0.\n00\n..") }
  let(:reverterplus) { Reverter.new("0.0.00\n..0...\n......") }
  let(:reverterultra) { Reverter.new("0..0..000.0.\n000....0.0..\n......000.00") }

  describe "#initialize" do
    it "exists" do
      expect(reverter).to be_an_instance_of(Reverter)
    end

    it "attributes" do
      expect(reverter.braille).to eq("0.\n00\n..")
    end
  end

  describe "#revert" do
    it "translates a single Braille letter back to English" do
      expect(reverter.revert).to eq("h")
    end

    it "translates multiple Braille letters back to English" do
      expect(reverterplus.revert).to eq("abc")
    end

    xit "translates multiple braille words back to English" do
      expect(reverterultra.revert).to eq("hi you")
    end
  end
end