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
        attribute :owner, type: :user_stub
      end
      attr = r.attributes.first
      expect(attr.name).to eq(:owner)
      expect(attr.attributes.map(&:name)).to contain_exactly(:name, :type)
    end
    it "works with examples" do
      Apipony.define_attribute_type :user_stub do 
        attribute :name, description: "A user's name", example: "Foo"
        attribute :id, description: "A user's ID", example: 1
      end
      r = Apipony::Response.new 200 do 
        attribute :id, type: :string, example: 10
        attribute :owner, type: :user_stub
      end
      expect(r.example.body).to eq({
        id: 10,
        owner: {
          name: "Foo",
          id: 1
        }
      })
    end
  end
  describe "examples" do
    it "wraps them in an array when the object is an array" do
      r = Apipony::ResponseAttribute.new :test, type: :enum do
        choice :foo
      end
      expect(r.example).to eq(:foo)
    end
    it "wraps array examples in arrays" do
      r = Apipony::ResponseAttribute.new :test, 
        type: :string,
        example: "Foo",
        array: true
      expect(r.example).to eq(["Foo"])
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
