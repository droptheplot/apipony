class Apipony::Section
  attr_accessor :title, :endpoints

  def initialize(title, &block)
    @title = title
    @endpoints = []

    instance_eval(&block)
  end

  def endpoint(method, url, &block)
    @endpoints << Apipony::Endpoint.new(method, url, &block)
  end
end
