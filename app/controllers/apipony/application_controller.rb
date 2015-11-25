module Apipony
  class ApplicationController < ActionController::Base
    def index
      @documentation = Apipony::Documentation
    end
  end
end
