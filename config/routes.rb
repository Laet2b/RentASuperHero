Rails.application.routes.draw do
  # get 'heros/index'
  # get 'heros/show'
  # get 'heros/new'
  # get 'heros/create'
  # get 'heros/destroy'
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :heros, only: [:index, :new, :show, :create, :destroy] do
    resources :bookings, only: [:index, :new, :show, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
end
