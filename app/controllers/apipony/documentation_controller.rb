module Apipony
  class DocumentationController < ApplicationController
    before_action :set_documentation

    def index
    end

    def sandbox
      lookup_endpoint = Apipony::Endpoint.new(params[:method], params[:url])
      @endpoint = @documentation.endpoints.find { |endpoint| endpoint == lookup_endpoint }
    end

    private

      def set_documentation
        @documentation = Apipony::Documentation
      end
  end
end
