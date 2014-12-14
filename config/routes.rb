Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users do
    get :summary, on: :member
    resources :alerts, only: :create
  end
  resources :patients, only: :index
  resources :entries do
    get 'categories/:category_type' => 'entries#categories', on: :collection, as: :category
    get :id
  end
  get 'activity_log', to: 'entries#activity_log'
  get 'dashboard', to: 'dashboard#index'
  resources :alerts

end
