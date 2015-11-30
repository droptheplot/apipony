class Apipony::ExampleResponse < Apipony::Base
  attr_accessor :status, :headers, :body

  def initialize(status, &block)
    @status = status
    instance_eval(&block) if block_given?
  end

end
