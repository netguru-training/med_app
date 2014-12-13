Rails.application.routes.draw do
  get 'patients/index'

  root to: 'visitors#index'
  devise_for :users
  resources :users do
    get :summary, as: :member
  end
  resources :patients, only: :index
  resources :entries
  get 'activity_log', to: 'entries#activity_log'
  get 'dashboard', to: 'dashboard#index'
end
