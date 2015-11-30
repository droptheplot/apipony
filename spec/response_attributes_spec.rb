require 'spec_helper'

RSpec.describe Apipony::ResponseAttribute do 
  describe "initialization" do
    it "has default arguments for all named paramters" do
      r = Apipony::ResponseAttribute.new(:test)
      expect(r.name).to eq(:test)
      expect(r.desription).to eq("")
    end
  end
end
