require 'spec_helper'
require './lib/reverter'

RSpec.describe Reverter do
  let(:reverter) { Reverter.new("0.\n00\n..") }
  let(:reverterplus) { Reverter.new("0.\n..\n..\n0.\n0.\n..\n00\n..\n..") }

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
  end
end