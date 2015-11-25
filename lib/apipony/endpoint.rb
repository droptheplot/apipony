class Apipony::Endpoint
  attr_accessor :method, :url, :description

  def initialize(method, url, &block)
    @method = method
    @url = set_base_url(url)

    instance_eval(&block)
  end

  private

    def set_base_url(url)
      File.join(Apipony::Documentation.base_url, url)
    end
end
