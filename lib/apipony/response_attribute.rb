##
# A class used to describe an attribute in a response.
class Apipony::ResponseAttribute
  @type_definitions = {}
  ##
  # Allow a common subobject definition for code reuse.
  # Probably use the `subtype` method in the `subtype` method of the DSL
  # `define` DSL instead. 
  def self.define_type(name, type)
    @type_definitions[name] = type
  end

  ##
  # Get a list of predefined subtypes.
  # Probably use the `
  def self.defined_subtypes
    @type_definitions
  end
  ##
  # Get a subtype with the given name.
  def self.get_defined(name)
    @type_definitions[name]
  end

  attr_accessor :name, :type, :description, :attributes, :choices
  def initialize(name, 
                 type: :string, 
                 description: "", 
                 array: false,
                 &block)
    @name = name
    @description = description
    @type = type
    @array = array
    if block_given? 
      instance_eval(&block)
    ## This attribute is of a predefined subtype
    elsif (subtype = self.class.get_defined(@type))
      @attributes = subtype.attributes
      # If the subtype is an array, this is also an array
      @array = subtype.is_array? unless @array
      @is_subtype = true
    end
  end

  ##
  # Is this attribute an array?
  # Note that marking an attribute as an array does not over-ride the top-level
  # type. For example, a definition like:
  #     attribute :aliases, type: :string, array: true
  # denotates an array of strings. Also note that subattributes are not
  # over-ridden. This lets you make an array of objects.
  #     attribute :users, type: :object, array: true do
  #       attribute :id, type: :integer
  #       attribute :name, type: :integer
  #     end
  #
  def is_array?
    !! @array
  end

  ##
  # See if this attribute is a reference to a predefined subtype.
  def is_subtype?
    !! @is_subtype
  end

  def use_defined(type)
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
