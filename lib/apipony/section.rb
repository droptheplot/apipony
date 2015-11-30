##
# A section is a way to logically separate your endpoints. All endpoints in
# a section should be related in some way. 
class Apipony::Section
  ##
  # What to call this endpoint. This will show up on the generated page.
  attr_accessor :title
  ##
  # :nodoc: 
  # This contains an array of endpoints added with the `endpoint` method of the
  # DSL
  attr_accessor :endpoints
  def initialize(title, &block)
    @title = title
    @endpoints = []

    instance_eval(&block)
  end

  def endpoint(method, url, &block)
    @endpoints << Apipony::Endpoint.new(method, url, &block)
  end
end
