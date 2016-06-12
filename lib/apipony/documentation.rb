##
# Top-level class for the DSL
class Apipony::Documentation
  class << self
    attr_accessor :title, :base_url, :sections

    def define(&block)
      @title = 'API Documentation'
      @sections = []

      instance_eval(&block)
    end

    ##
    # Start a new section.
    # Sections are logically separated on the display page.
    def section(title, &block)
      @sections << Apipony::Section.new(title, &block)
    end

    ##
    # Configure API pony with the DSL
    def configure(&block)
      instance_eval(&block)
    end

    def title(value)
      @title = value
    end

    def base_url(value)
      @base_url = value
    end

    def data
      OpenStruct.new(
        title: @title,
        base_url: @base_url
      )
    end
  end
end
