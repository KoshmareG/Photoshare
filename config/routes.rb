Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "photos#index"

  get "home", action: :show, controller: "home"

  resources :photos do
    resources :likes, only: [:create]
  end

  resources :users do
    resources :subscribes, only: [:create]
  end

  resources :users, only: [:edit, :update]
  resources :profiles, only: [:show]
end
