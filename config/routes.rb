Rails.application.routes.draw do
  # get 'heroes/index'
  # get 'heroes/show'
  # get 'heroes/new'
  # get 'heroes/create'
  # get 'heroes/destroy'
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :heroes, only: [:index, :new, :show, :create, :destroy] do
    resources :bookings, only: [:index, :new, :show, :create, :destroy]
  end
end
