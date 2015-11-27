class Apipony::Endpoint < Apipony::Base
  attr_accessor :method, :url, :description, :response, :request

  def initialize(method, url, &block)
    @method = method
    @url = set_base_url(url)

    instance_eval(&block) if block_given?
  end

  def response_with(status, &block)
    @response = Apipony::Response.new(status, &block)
  end

  def request_with(&block)
    @request = Apipony::Request.new(&block)
  end

  def id
    "#{ @method }-#{ @url }"
  end

  private

    def set_base_url(url)
      File.join(Apipony::Documentation.base_url, url)
    end
end
