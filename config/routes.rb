Rails.application.routes.draw do
  devise_for :users
  resources :shots
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'shots#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
