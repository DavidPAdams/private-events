Rails.application.routes.draw do
  # need a root
  get  '/signup',  to: 'users#new'  
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index, :new, :create, :show]
end
