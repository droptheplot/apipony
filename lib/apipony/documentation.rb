# Top-level class for the DSL
module Apipony
  class Documentation
    class << self
      attr_accessor :title, :base_url, :sections

      def define(&block)
        @title = 'API Documentation'
        @sections = []
        @console = false

        instance_eval(&block)
      end

      # Start a new section.
      # Sections are logically separated on the display page.
      def section(title, &block)
        @sections << Apipony::Section.new(title, &block)
      end

      # Configure API pony with the DSL
      def configure(&block)
        instance_eval(&block)
      end

      def title(value = nil)
        @title = value if value
        @title
      end

      def base_url(value = nil)
        @base_url = value if value
        @base_url
      end

      def console(value = false)
        @console = value if value
        @console
      end

      alias console? console

      def endpoints
        @sections.map(&:endpoints).flatten
      end
    end
  end
end
