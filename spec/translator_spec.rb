require './lib/translator'

RSpec.describe Translator do
  let(:translator) { Translator.new("H") }

  describe "#initialize" do
    it "exists" do
      expect(translator).to be_an_instance_of(Translator)
    end

    it "#attributes" do
      expect(translator.message).to eq("H")
    end
  end
end