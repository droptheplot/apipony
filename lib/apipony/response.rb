class Apipony::Response
  attr_accessor :example, :attributes, :status
  def initialize(status, &block)
    @status = status
    @attributes = []
    instance_eval(&block) if block_given?
  end

  def example(&block)
    if block_given?
      @example = Apipony::ExampleResponse.new(&block)
    else
      @example
    end
  end

  def attribute(name, **params, &block)
    @attributes << Apipony::ResponseAttribute.new(name, **params, &block)
  end

end
