module Apipony
  ## 
  # Rails engine so you can just drop Apipony right into your application
  class Engine < ::Rails::Engine
    isolate_namespace Apipony
  end
end
