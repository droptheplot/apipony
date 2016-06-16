module Apipony
  class DocumentationController < ApplicationController
    def index
      @documentation = Apipony::Documentation
    end
  end
end
