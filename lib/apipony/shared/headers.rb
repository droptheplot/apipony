module Apipony
  module Shared
    module Headers
      attr_accessor :headers

      def headers
        @headers = yield if block_given?
      end
    end
  end
end
