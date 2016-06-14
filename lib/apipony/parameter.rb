module Apipony
  class Parameter
    OPTIONS = %i(name type example required description)

    attr_accessor(*OPTIONS)

    def initialize(name, options = {})
      @name = name
      @example = options[:example]
      @description = options[:description]
      @type = options.fetch(:type, :string)
      @required = options.fetch(:required, false)
    end

    alias_method :required?, :required

    def ==(other)
      OPTIONS.all? do |option|
        public_send(option) == other.public_send(option)
      end
    end
  end
end
