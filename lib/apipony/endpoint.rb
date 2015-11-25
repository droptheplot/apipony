class Apipony::Endpoint
  attr_accessor :url, :description

  def initialize(url, &block)
    @url = set_base_url(url)

    instance_eval(&block)
  end

  private

    def set_base_url(url)
      File.join(Apipony::Documentation.base_url, url)
    end
end
