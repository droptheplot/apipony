class Apipony::ResponseAttribute
  attr_accessor :name, :type, :description, :attributes
  def initialize(name, type: :string, description: "", &block)
    @name = name
    @description = description
    @type = type
  end
end
