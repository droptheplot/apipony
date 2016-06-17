Apipony::Engine.routes.draw do
  root 'documentation#index'

  get 'sandbox/:method/*url' => 'documentation#sandbox'
end
