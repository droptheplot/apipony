##
# Model a response endpoint.
class Apipony::Endpoint < Apipony::Base
  ##
  # What HTTP verb to use to access this endpoint
  attr_accessor :method
  ##
  # The URl of this endpoint
  attr_accessor :url

  ##
  # A short description of what this endpoint does and why it may be useful.
  attr_accessor :description

  ##
  #:nodoc:
  attr_accessor :response, :request

  def initialize(method, url, &block)
    @method = method
    @url = set_base_url(url)

    instance_eval(&block) if block_given?
  end

  ##
  # DSL method to start describing a response
  def response_with(status, &block)
    @response = Apipony::Response.new(status, &block)
  end

  ##
  # DSL method to start describind a request
  def request_with(&block)
    @request = Apipony::Request.new(&block)
  end

  ##
  # Create a unique identifier for this endpoint
  def id
    File.join(@method, @url)
  end

  private

    def set_base_url(url)
      File.join(Apipony::Documentation.base_url, url)
    end
end
