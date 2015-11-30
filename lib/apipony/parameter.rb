class Apipony::Parameter < Apipony::Base
  attr_accessor :name, :type, :example, :required, :description

  def initialize(name, example, type, required, description)
    @name = name
    @example = example
    @type = type
    @required = required
    @description = description
  end
end
