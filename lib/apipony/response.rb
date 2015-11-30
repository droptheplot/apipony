class Apipony::Response
  attr_accessor :example, :attributes
  def initialize(&block)
    instance_eval(&block)
  end

  def example(&block)
    @example = Apipony::ExampleResponse.new(&block)
  end

  def attribute(name = nil, **params, &block)
    
  end
end
