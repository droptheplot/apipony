Apipony::Engine.routes.draw do
  root 'documentation#index'

  get 'console/:method/*url' => 'documentation#console'
end
