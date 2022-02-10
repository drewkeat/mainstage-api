Rails.application.routes.draw do
  resources :applications
  resources :roles
  resources :productions
  post '/login', to: 'auth#create'
  post '/authenticate', to: 'auth#authenticate'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
