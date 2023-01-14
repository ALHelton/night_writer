require './lib/translator'

RSpec.describe Translator do
  let(:translator) { Translator.new }

  describe "#initialize" do
    it "exists" do
      expect(translator).to be_an_instance_of(Translator)
    end

    xit "#attributes" do

    end
  end
end