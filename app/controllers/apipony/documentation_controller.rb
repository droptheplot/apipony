module Apipony
  class DocumentationController < ApplicationController
    before_action :set_documentation

    def index
    end

    def console
      lookup_endpoint = Apipony::Endpoint.new(params[:method], params[:url])
      @endpoint = @documentation.endpoints.find do |endpoint|
        endpoint == lookup_endpoint
      end
    end

    private

      def set_documentation
        @documentation = Apipony::Documentation
      end
  end
end
