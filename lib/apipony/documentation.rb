class Apipony::Documentation
  class << self
    attr_accessor :base_url, :sections

    def build(&block)
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
