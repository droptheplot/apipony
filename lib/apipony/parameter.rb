class Apipony::Parameter
  attr_accessor :name, :type, :example, :required, :description

  def initialize(name, params = {})
    @name = name
    @example = params[:example]
    @description = params[:description]
    @type = params.fetch(:type, :string)
    @required = params.fetch(:required, false)
  end

  alias_method :required?, :required
end
