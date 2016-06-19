module Apipony
  module Shared
    module Description
      attr_accessor :description

      def description(value = nil)
        @description = value if value
        @description
      end
    end
  end
end
