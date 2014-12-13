Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users do
    get :summary, as: :member
  end
  resources :entries
  get 'dashboard', to: 'dashboard#index'
end
