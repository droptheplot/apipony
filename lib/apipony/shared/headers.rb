module Apipony
  module Shared
    module Headers
      attr_accessor :headers

      def headers
        @headers = yield if block_given?
        @headers.to_h.stringify_keys.transform_values(&:to_s)
      end

      def headers?
        @headers.present?
      end
    end
  end
end
