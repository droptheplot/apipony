module Apipony
  module Shared
    module Description
      attr_accessor :description

      def description(value)
        @description = value
      end
    end
  end
end
