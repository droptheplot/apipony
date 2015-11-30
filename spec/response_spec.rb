require 'spec_helper'

RSpec.describe Apipony::Response do 
  describe "example generation" do
    it "allows top-level array generation" do
      r = Apipony::Response.new 200, array: true do 
        attribute :name, example: "Test"
      end
      expect(r.example.body).to be_a(Array)
      expect(r.example.body.first).to eq({name: "Test"})
    end
    it "serializes from attributes" do
      r = Apipony::Response.new 200 do 
        attribute :name, example: "Test"
        attribute :foo do
          attribute :id, example: 1
        end
      end
      expect(r.example.body).to eq({
        name: "Test",
        foo: {
          id: 1
        }
      })
    end
  end
end
