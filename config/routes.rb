Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'requests#index'
  resources :requests
  resources :users, only: [:show], constraints: { id: /\d+/ }
end
