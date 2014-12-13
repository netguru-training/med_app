Rails.application.routes.draw do
  get 'patients/index'

  root to: 'visitors#index'
  devise_for :users
  resources :users do
    get :summary, as: :member
  end
  resources :patients, only: :index
  resources :entries
  get 'dashboard', to: 'dashboard#index'
end