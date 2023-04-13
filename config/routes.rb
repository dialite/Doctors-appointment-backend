Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :appointments
  resources :doctors
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # post '/auth/login', to: 'authentication#login'

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show create update destroy]
      resources :doctors, only: %i[index show create update destroy]
      resources :appointments, only: %i[index show create update destroy]
      # post '/auth/signup', to: 'users#create'
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
end
