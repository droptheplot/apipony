Rails.application.routes.draw do
  mount Apipony::Engine => "/apipony"
  
  root 'application#index'
end
