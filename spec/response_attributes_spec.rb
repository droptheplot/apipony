require 'spec_helper'

RSpec.describe Apipony::ResponseAttribute do 
  describe "initialization" do
    it "has default arguments for all named paramters" do
      r = Apipony::ResponseAttribute.new(:test)
      expect(r.name).to eq(:test)
      expect(r.description).to eq("")
    end
  end
  describe "nesting" do
    it "allows nesting parameters" do
      r = Apipony::ResponseAttribute.new :test do
        attribute :foo, type: :string
      end
      expect(r.attributes.first.name).to eq(:foo)
    end
  end
end
