require 'spec_helper'
require './lib/reverter'

RSpec.describe Reverter do
  let(:reverter) { Reverter.new("0.\n00\n..") }

  describe "#initialize" do
    it "exists" do
      expect(reverter).to be_an_instance_of(Reverter)
    end

    it "attributes" do
      expect(reverter.braille).to eq("0.\n00\n..")
    end
  end
end