class Apipony::Response
  attr_accessor :example, :attributes, :status
  def initialize(status, &block)
    @status = status
    @attributes = []
    instance_eval(&block) if block_given?
  end

  def example(&block)
    @example = Apipony::ExampleResponse.new(&block)
  end

  def attribute(name = nil, **params, &block)
    @attributes << Apipony::ResponseAttribute.new(name, **params, &block)
  end
end
