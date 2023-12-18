Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'requests#index'
  resources :requests
  resources :users, only: [:show], constraints: { id: /\d+/ }

  resources :requests do
    resources :transfer_requests, only: [:new, :create]
  end

  get '/users_by_role', to: 'users#users_by_role', defaults: { format: 'json' }

end
