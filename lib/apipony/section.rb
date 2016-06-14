# A section is a way to logically separate your endpoints. All endpoints in
# a section should be related in some way.
module Apipony
  class Section
    include Apipony::Shared::Description

    # What to call this endpoint. This will show up on the generated page.
    attr_accessor :title

    # This contains an array of endpoints added with the `endpoint`
    # method of the DSL
    attr_accessor :endpoints

    def initialize(title, &block)
      @title = title
      @endpoints = []

      instance_eval(&block) if block_given?
    end

    def endpoint(method, url, &block)
      @endpoints << Apipony::Endpoint.new(method, url, &block)
    end

    def data
      OpenStruct.new(
        description: @description
      )
    end
  end
end
