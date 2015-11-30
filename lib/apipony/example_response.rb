class Apipony::ExampleResponse < Apipony::Base
  attr_accessor :headers, :body
  def initialize(&block)
    instance_eval(&block)
  end

end
