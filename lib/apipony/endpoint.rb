class Apipony::Endpoint < Apipony::Base
  attr_accessor :method, :url, :description, :response

  def initialize(method, url, &block)
    @method = method
    @url = set_base_url(url)

    instance_eval(&block)
  end

  def response_with(status, &block)
    @response = Apipony::Response.new(status, &block)
  end

  private

    def set_base_url(url)
      File.join(Apipony::Documentation.base_url, url)
    end
end
