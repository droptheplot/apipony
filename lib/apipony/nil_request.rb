module Apipony
  class NilRequest < Request
    def params
      []
    end
  end
end
