class Apipony::ResponseAttribute
  attr_accessor :name, :type, :description, :attributes, :choices
  def initialize(name, type: :string, description: "", &block)
    @name = name
    @description = description
    @type = type
    instance_eval(&block) if block_given?
  end

  def attribute(name, **params, &block)
    @attributes ||= []
    @attributes << self.class.new(name, **params, &block)
    @type = :object
  end

  def is_object?
    @type == :object
  end

  def is_enum?
    @type == :enum
  end

  def choice(name, **params)
    @choices ||= []
    @type = :enum
    @choices << EnumChoice.new(name, **params)
  end

  class EnumChoice
    attr_accessor :name, :description
    def initialize(name, description: "")
      @name = name
      @description = description
    end
  end

end
