Apipony::Engine.routes.draw do
  root 'documentation#index'

  get 'console/:method/*url' => 'documentation#console'
  match 'sandbox/*url', to: 'documentation#sandbox', via: :all
end
