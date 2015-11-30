##
# Model a request that an API user can make.
# Includes information about required parameters and required headers
class Apipony::Request < Apipony::Base
  ##
  # :nodoc:
  attr_accessor :params
  ##
  #:nodoc:
  attr_accessor :headers

  def initialize(&block)
    @params = []

    instance_eval(&block)
  end
  ##
  # Construct a new parameter
  def param(name, 
            example: '', 
            type: :string, 
            required: false,
            description: '')
    @params << Apipony::Parameter.new(name, example, type, required, description)
  end
end
