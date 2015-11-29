class Apipony::Parameter < Apipony::Base
  attr_accessor :name, :type, :example, :required

  def initialize(name, example, type, required)
    @name = name
    @example = example
    @type = type
    @required = required
  end
end
