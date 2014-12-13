Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get 'dashboard', to: 'dashboard#index'
end
