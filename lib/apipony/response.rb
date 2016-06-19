module Apipony
  class Response
    include Apipony::Shared::Headers

    attr_accessor :status, :body

    def initialize(&block)
      @status = 200

      instance_eval(&block) if block_given?
    end

    def status(value = nil)
      @status = value if value
      @status
    end

    def body
      @body = yield if block_given?
      @body
    end

    def data?
      !(@status.nil? && @body.nil?)
    end
  end
end
