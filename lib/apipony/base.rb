class Apipony::Base
  private

    def set(variable, value)
      instance_variable_set("@#{ variable }", value)
    end
end
