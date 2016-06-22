Rails.application.routes.draw do
  mount Apipony::Engine => "/apipony"

  root 'application#index'

  match 'api/v1/*path', to: 'api#demo', via: :all
end
