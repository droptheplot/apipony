##
# Model a response endpoint.
class Apipony::Endpoint
  ##
  # What HTTP verb to use to access this endpoint
  attr_accessor :method
  ##
  # The URl of this endpoint
  attr_accessor :url

  ##
  # A short description of what this endpoint does and why it may be useful.
  attr_accessor :description

  attr_accessor :response, :request

  def initialize(method, url, &block)
    @method = method
    @url = build_url(url)

    instance_eval(&block) if block_given?
  end

  ##
  # DSL method to start describing a response
  def response_with(&block)
    @response = Apipony::Response.new(&block)
  end

  ##
  # DSL method to start describind a request
  def request_with(&block)
    @request = Apipony::Request.new(&block)
  end

  def description(value)
    @description = value
  end

  ##
  # Create a unique identifier for this endpoint
  def id
    File.join(@method.to_s, @url)
  end

  def data
    OpenStruct.new(
      description: @description
    )
  end

  private

    def build_url(url)
      File.join(Apipony::Documentation.data.base_url, url)
    end
end
