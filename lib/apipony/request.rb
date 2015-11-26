class Apipony::Request < Apipony::Base
  attr_accessor :params, :headers

  def initialize(&block)
    instance_eval(&block)
  end
end
