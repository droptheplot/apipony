class Apipony::ResponseAttribute
  @type_definitions = {}
  ##
  # Allow a common subobject definition for code reuse
  def self.define_type(name, type)
    @type_definitions[name] = type
  end

  def self.get_defined(name)
    @type_definitions[name]
  end
  attr_accessor :name, :type, :description, :attributes, :choices
  def initialize(name, 
                 type: :string, 
                 description: "", 
                 &block)
    @name = name
    @description = description
    @type = type
    instance_eval(&block) if block_given?
  end

  def use_defined(name, as:)
    a = self.class.get_defined(name)
    raise "Tried to use an undefined subtype" unless a
    ##
    # Shallow clone so we can alias the name
    a = a.clone
    a.name = as
    add_subattribute a
  end

  def attribute(name, **params, &block)
    add_subattribute self.class.new(name, **params, &block)
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
  private
  def add_subattribute atr
    @attributes ||= []
    @type = :object
    @attributes << atr
  end
end
