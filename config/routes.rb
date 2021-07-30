Rails.application.routes.draw do
  resources :organizations, only: [:index, :show , :create, :update]
  resources :users, only: [:show, :update , :delete]
  resources :shifts, only: [:create , :show , :update, :delete]

  get '/shifts/index/:organization_id/', to: 'shifts#index'
  post '/login', to: 'auth#login'
  get '/profile', to: 'users#profile'
  post '/signup', to: 'users#create'
  patch '/join/:user_id/:organization_id', to: 'users#join_organization'
  patch '/quit/:user_id', to: 'users#quit_organization'

  delete '/organizations/:id', to: 'organizations#delete'
  delete '/users/:id' ,to: 'users#delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
