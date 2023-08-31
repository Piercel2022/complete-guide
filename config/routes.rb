Rails.application.routes.draw do


  root 'shots#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #root 'shots#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
