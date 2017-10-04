Rails.application.routes.draw do




  root 'application#home'
  get 'sessions/new'
  get 'venue/new'
    get 'events/new'

  resources :users
  resources  :venue

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get  '/venue_signup',  to: 'venue#new'
  post '/venue_signup',  to: 'venue#create'
  delete '/venue_logout',  to: 'sessions#destroy'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
