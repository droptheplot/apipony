##
# Model a request that an API user can make.
# Includes information about required parameters and required headers
class Apipony::Request
  include Apipony::Shared::Headers

  ##
  # :nodoc:
  attr_accessor :params

  def initialize(&block)
    @params = []

    instance_eval(&block)
  end
  ##
  # Construct a new parameter
  def param(name, *params)
    @params << Apipony::Parameter.new(name, *params)
  end

  def data
    OpenStruct.new(
      headers: @headers,
      params: params
    )
  end

  private

    def params
      @params.sort_by { |e| e.required? ? -1 : 0 }
    end
end
