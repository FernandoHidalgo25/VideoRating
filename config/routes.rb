Rails.application.routes.draw do
  resources :ratings
  resources :videos do
    resources :ratings
  end
  resources :users do
    resources :ratings, only: [:show]
  end
  resources :videos do
    resources :users
  end 

  root 'users#homepage'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  delete '/logout' => 'session#destroy'
  get '/secret' => 'secrets#show'

  get '/signup' => 'user#new'
  post '/signup' => 'user#create'


  delete '/ratings/:id/' => 'rating#delete'

  get '/auth/facebook/callback' => 'sessions#acreate'

  get 'top_rating' => 'ratings#top_rating'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
