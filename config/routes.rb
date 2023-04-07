Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  resources :appointments
  resources :doctors
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/auth/login', to: 'authentication#login'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :doctors, only: %i[index show create destroy] do
        resources :appointments, only: %i[index show create destroy]
      end
      post '/auth/signup', to: 'users#create'
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
end
