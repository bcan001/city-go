Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id/upcoming_rsvp_events', to: 'users#upcoming_rsvp_events', as: 'user_upcoming_rsvp_events'
  get 'users/:id/past_rsvp_events', to: 'users#past_rsvp_events', as: 'user_past_rsvp_events'

  resources :user_profiles, :controller => 'users'

  get '/tomorrows_events', to: 'events#tomorrows_events', as: 'tomorrows_events'

  get 'artists/:id/upcoming_events', to: 'artists#upcoming_events', as: 'artist_upcoming_events'
  get 'artists/:id/past_events', to: 'artists#past_events', as: 'artist_past_events'

  get 'venues/:id/upcoming_events', to: 'venues#upcoming_events', as: 'venue_upcoming_events'
  get 'venues/:id/past_events', to: 'venues#past_events', as: 'venue_past_events'

  
  resources :events
  resources :artists
  resources :venues
  resources :searches
  resources :user_rsvps
  resources :votes
  resources :user_favorites

  get '/latest', to: 'statics#latest', as: 'latest'
  get '/featured', to: 'statics#featured', as: 'featured'
  get '/find_us', to: 'statics#find_us', as: 'find_us'


  root 'events#index'


end




