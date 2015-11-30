require 'spec_helper'

RSpec.describe Apipony::ResponseAttribute do 
  describe "type definitions" do
    it "allows use of definitions" do
      Apipony.define_attribute_type :user_stub do
        attribute :name, description: "This users's name"
        attribute :type do
          choice :admin, description: "An administrative user"
          choice :mod, description: "A moderator"
          choice :normal, description: "A regular user"
        end
      end
      r = Apipony::ResponseAttribute.new :image do
        use_defined :user_stub, as: :owner
      end
      attrs = r.attributes.first.attributes
      expect(attrs.map(&:name)).to contain_exactly(:name, :type)
    end
  end
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
  describe "enum attributes" do
    it "allows enum attributes and sets the type properly" do
      r = Apipony::ResponseAttribute.new :test do
        choice :fraud, description: "What Jay is"
        choice :hack, description: "What Mike is"
      end
      expect(r.choices.length).to eq(2)
      expect(r.type).to eq(:enum)
    end
  end
end
