class Apipony::Documentation
  class << self
    attr_accessor :title, :base_url, :sections

    def define(&block)
      @sections = []

      instance_eval(&block)
    end

    def section(title, &block)
      @sections << Apipony::Section.new(title, &block)
    end

    def config(&block)
      instance_eval(&block)
    end
  end
end
