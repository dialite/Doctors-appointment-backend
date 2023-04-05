Rails.application.routes.draw do
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
end
