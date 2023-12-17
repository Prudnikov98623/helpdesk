Rails.application.routes.draw do
  devise_for :users
  root 'requests#index'  # Эта строка устанавливает главную страницу
  resources :requests


end
