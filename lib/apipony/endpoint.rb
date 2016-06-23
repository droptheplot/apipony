##
# Model a response endpoint.
module Apipony
  class Endpoint
    include Apipony::Shared::Description
    ##
    # What HTTP verb to use to access this endpoint
    attr_accessor :method
    ##
    # The URl of this endpoint
    attr_accessor :url

    attr_accessor :path

    attr_accessor :response, :request

    def initialize(method, path, &block)
      @method = method.to_sym
      @path = path
      @url = build_url(@path)
      @request = NilRequest.new
      @response = NilResponse.new

      instance_eval(&block) if block_given?
    end

    # DSL method to start describing a response
    def response_with(&block)
      @response = Apipony::Response.new(&block)
    end

    def response?
      @response.instance_of?(Apipony::Response)
    end

    # DSL method to start describind a request
    def request_with(&block)
      @request = Apipony::Request.new(&block)
    end

    def request?
      @request.instance_of?(Apipony::Request)
    end

    ##
    # Create a unique identifier for this endpoint
    def id
      File.join(@method.to_s, @path)
    end

    def console_path
      File.join('console', id)
    end

    def ==(other)
      method == other.method && url == other.url
    end

    private

      def build_url(url)
        File.join(Apipony::Documentation.base_url, url)
      end
  end
end
