Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'

  resources :users
  resources :events, only: [:new, :create, :destroy, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
end
