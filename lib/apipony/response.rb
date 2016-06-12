module Apipony
  class Response
    include Apipony::Shared::Headers

    attr_accessor :status, :body

    def initialize(&block)
      @status = 200

      instance_eval(&block)
    end

    def status(code)
      @status = code if code
    end

    def body
      @body = yield if block_given?
    end

    def data?
      !(@status.nil? && @body.nil?)
    end

    def data
      OpenStruct.new(
        status: @status,
        headers: @headers,
        body: @body
      )
    end
  end
end
