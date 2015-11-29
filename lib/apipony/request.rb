class Apipony::Request < Apipony::Base
  attr_accessor :params, :headers

  def initialize(&block)
    @params = []

    instance_eval(&block)
  end

  def param(name, example: '', type: :string, required: false)
    @params << Apipony::Parameter.new(name, example, type, required)
  end
end
