module Apipony
  class DocumentationController < ApplicationController
    before_action :set_documentation
    before_action :set_endpoint, only: :console

    def index
    end

    def console
    end

    def sandbox
      params[:method] = request.method_symbol

      set_endpoint

      response.headers.merge!(@endpoint.response.headers)

      render json: @endpoint.response.body
    end

    private

      def set_documentation
        @documentation = Apipony::Documentation
      end

      def set_endpoint
        @endpoint = @documentation.endpoints.find do |endpoint|
          endpoint == Apipony::Endpoint.new(params[:method], params[:url])
        end
      end
  end
end
