class Apipony::Base
  private

    def set(variable, value)
      puts "Setting #{variable} to #{value.inspect}"
      instance_variable_set("@#{ variable }", value)
    end
end
