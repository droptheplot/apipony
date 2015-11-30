##
# Top-level class for the DSL 
class Apipony::Documentation
  class << self
    attr_accessor :title, :base_url, :sections

    def define(&block)
      @sections = []
      @title = 'API Documentation'
      @base_url = ''

      instance_eval(&block)
    end
    ##
    # @return [Hash<String, ApiPony::ResponseAttribute] a hash of each subype.
    #   keys are the names of the subtype, values are the attribute object that
    #   defines it
    def subtypes
      Apipony::ResponseAttribute.defined_subtypes
    end

    ##
    # Start a new section.
    # Sections are logically separated on the display page.
    def section(title, &block)
      @sections << Apipony::Section.new(title, &block)
    end

    ##
    # Define a new subtype.
    # A subtype describes a common object used in various places in your Api.
    # Once defined, setting the `type` of an attribute to this given name will
    # cause it to reference this subtype in a common location. 
    # @param [String] name what to call this subtype
    def subtype(name, **params, &block)
      Apipony.define_attribute_type(name, **params, &block)
    end

    ##
    # Configure API pony with the DSL
    def config(&block)
      instance_eval(&block)
    end
  end
end
