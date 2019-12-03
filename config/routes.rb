Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  post   '/login',   to: 'sessions#create'
  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'
  get '/userlist',     to: 'users#list'

  get '/list',     to: 'spaces#list'
  get '/show',     to: 'spaces#show'
  get '/new',      to: 'spaces#new'
  get '/menu',     to: 'spaces#menu'
  get '/spaceedit', to: 'spaces#edit'

  get '/index',     to: 'reservations#list'

  resources :users
  resources :spaces
  resources :reservations
end
