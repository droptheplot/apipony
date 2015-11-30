class Apipony::Response
  attr_accessor :example, :attributes, :status
  def initialize(status, array: false, &block)
    @status = status
    @attributes = []
    @array = array
    instance_eval(&block) if block_given?
  end

  def is_array?
    !! @array
  end

  def example(&block)
    if block_given?
      @example = Apipony::ExampleResponse.new(&block)
    else
      find_example
    end
  end

  def attribute(name, **params, &block)
    if params[:example]
      @use_attribute_examples = true
    end
    @attributes << Apipony::ResponseAttribute.new(name, **params, &block)
  end
  private
  def find_example
    if @use_attribute_examples
      build_example_from_attributes
    end
    @example
  end

  def build_example_from_attributes
    build = Hash.new
    @attributes.each do |attr|
      build[attr.name] = attr.example if attr.example
    end
    @example ||= Apipony::ExampleResponse.new
    case @example.body
    when Hash
      @example.body.merge! build
      @example.body = [@example.body] if is_array?
    when NilClass
      @example.body = (is_array? ? [build] : build)
    end
    @example
  end
end
